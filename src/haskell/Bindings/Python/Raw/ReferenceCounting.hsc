{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.dsl.h>
#include <Python.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.ReferenceCounting
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-----------------------------------------------------------------
module Bindings.Python.Raw.ReferenceCounting
    (   c'Py_XINCREF
    ,   p'Py_XINCREF
    ,   c'Py_XDECREF
    ,   p'Py_XDECREF
    ) where

import Bindings.Python.Raw.Types

#strict_import

#ccall Py_XINCREF, Ptr <PyObject> -> IO ()

#ccall Py_XDECREF, Ptr <PyObject> -> IO ()

