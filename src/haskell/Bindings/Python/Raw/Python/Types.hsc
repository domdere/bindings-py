{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.dsl.h>
#include <Python.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Types
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- Haskell verisons of the C types.
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Python.Types
    (   C'PyObject(..)
    ,   C'Py_ssize_t
    ,   C'int
    ) where
#strict_import

#opaque_t PyObject

#integral_t Py_ssize_t

#integral_t int

