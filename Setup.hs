#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
module Main (main) where

import Data.List ( nub, isInfixOf )
import Data.Version ( showVersion )
import Distribution.Package ( PackageName(PackageName), PackageId, InstalledPackageId, packageVersion, packageName )
import Distribution.PackageDescription ( emptyBuildInfo, BuildInfo(..), PackageDescription(..), TestSuite(..) )
import Distribution.Simple ( defaultMainWithHooks, UserHooks(..), autoconfUserHooks, simpleUserHooks )
import Distribution.Simple.Utils ( rewriteFile, createDirectoryIfMissingVerbose )
import Distribution.Simple.BuildPaths ( autogenModulesDir )
import Distribution.Simple.Setup ( BuildFlags(buildVerbosity), fromFlag )
import Distribution.Simple.LocalBuildInfo   ( withPrograms, withLibLBI, withTestLBI, LocalBuildInfo(), ComponentLocalBuildInfo(componentPackageDeps) )
import Distribution.PackageDescription.Parse ( writeHookedBuildInfo )
import Distribution.Simple.Program ( rawSystemProgramStdout, requireProgram, simpleProgram, Program )
import Distribution.Verbosity ( Verbosity, normal )
import System.FilePath ( (</>) )

main :: IO ()
main = defaultMainWithHooks autoconfUserHooks
    {   buildHook = \pkg lbi hooks flags -> do
            generateBuildModule (fromFlag (buildVerbosity flags)) pkg lbi
            buildHook simpleUserHooks pkg lbi hooks flags
    ,   hookedPrograms = [pyInterpreter]
    ,   postConf = postConfigure
    }

pyInterpreter :: Program
pyInterpreter = simpleProgram "python"

postConfigure ::  a -> b -> c -> LocalBuildInfo -> IO ()
postConfigure _ _ _ lbi = do
    configInfo <- pyConfigInfo normal lbi
    writeHookedBuildInfo "bindings-py.buildinfo" (configInfo, [])

pyVersionDefines :: [(Float -> Bool, String)]
pyVersionDefines =  [   ((< 2.5), "PYTHON_PRE_2.5")
                    ,   ((< 2.3), "PYTHON_PRE_2.3")
                    ]

definesFor :: Float -> [String]
definesFor v = map (\t -> "-D" ++ snd t) $ filter (`fst` v) pyVersionDefines

pyConfigInfo ::  Verbosity -> LocalBuildInfo -> IO (Maybe BuildInfo)
pyConfigInfo verbosity lbi = do
    (pyConfigProg, _) <- requireProgram verbosity pyInterpreter (withPrograms lbi)

    let python = rawSystemProgramStdout verbosity pyConfigProg

    libDir          <- python ["-c", "from distutils.sysconfig import *; print get_python_lib()"]
    incDir          <- python ["-c", "from distutils.sysconfig import *; print get_python_inc()"]
    confDir         <- python ["-c", "from distutils.sysconfig import *; print get_config_var('LIBDIR')"]
    pyVersionStr    <- python ["-c", "import sys; sys.stdout.write(\"%d.%d\" % (sys.version_info[0], sys.version_info[1]))"]

    let
        libName = "python" ++ pyVersionStr
        pyVersion = read pyVersionStr

    return $ Just emptyBuildInfo {
        extraLibDirs    = lines confDir ++ lines libDir
    ,   includeDirs     = lines incDir ++ ["src/c/include"]
    ,   extraLibs       = lines libName
    ,   cppOptions      = definesFor pyVersion
    }


generateBuildModule :: Verbosity -> PackageDescription -> LocalBuildInfo -> IO ()
generateBuildModule verbosity pkg lbi = do
  let dir = autogenModulesDir lbi
  createDirectoryIfMissingVerbose verbosity True dir
  withLibLBI pkg lbi $ \_ libcfg ->
    withTestLBI pkg lbi $ \suite suitecfg ->
      rewriteFile (dir </> "Build_" ++ testName suite ++ ".hs") $ unlines
        [ "module Build_" ++ testName suite ++ " where"
        , "deps :: [String]"
        , "deps = " ++ show (formatdeps (testDeps libcfg suitecfg))
        ]
  where
    formatdeps = filter (not . isInfixOf "bindings-DSL") . map (formatone . snd)
    formatone p = case packageName p of
      PackageName n -> n ++ "-" ++ showVersion (packageVersion p)

testDeps :: ComponentLocalBuildInfo -> ComponentLocalBuildInfo -> [(InstalledPackageId, PackageId)]
testDeps xs ys = nub $ componentPackageDeps xs ++ componentPackageDeps ys
