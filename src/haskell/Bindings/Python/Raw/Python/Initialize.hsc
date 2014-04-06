{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.dsl.h>
#include <Python.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Python.Initialize
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Python.Initialize
    (   c'Py_Initialize
    ,   p'Py_Initialize
    ) where

import Bindings.Python.Raw.Python.Types

#strict_import

#ccall Py_Initialize    , IO ()
