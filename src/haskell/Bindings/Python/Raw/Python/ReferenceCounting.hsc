{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.dsl.h>
#include <Python.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Python.ReferenceCounting
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Python.ReferenceCounting
    (   c'Py_XINCREF
    ,   p'Py_XINCREF
    ,   c'Py_XDECREF
    ,   p'Py_XDECREF
    ) where

import Bindings.Python.Raw.Python.Types

#strict_import

#ccall Py_XINCREF, Ptr <PyObject> -> IO ()

#ccall Py_XDECREF, Ptr <PyObject> -> IO ()

