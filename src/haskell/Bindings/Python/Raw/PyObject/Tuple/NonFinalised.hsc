{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.PyObject.Tuple.NonFinalised
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- The direct bindings to the Python C API for tuples,
--
-- Refer to this: <https://docs.python.org/2/c-api/tuple.html>
--
-----------------------------------------------------------------
module Bindings.Python.Raw.PyObject.Tuple.NonFinalised (
        c'PyTuple_Check
    ,   p'PyTuple_Check
    ,   c'PyTuple_CheckExact
    ,   p'PyTuple_CheckExact
    ,   c'PyTuple_New
    ,   p'PyTuple_New
    ,   c'PyTuple_Pack
    ,   p'PyTuple_Pack
    ,   c'PyTuple_Size
    ,   p'PyTuple_Size
    ,   c'PyTuple_GET_SIZE
    ,   p'PyTuple_GET_SIZE
    ,   c'PyTuple_GetItem
    ,   p'PyTuple_GetItem
    ,   c'PyTuple_GET_ITEM
    ,   p'PyTuple_GET_ITEM
    ,   c'PyTuple_GetSlice
    ,   p'PyTuple_GetSlice
    ,   c'PyTuple_SetItem
    ,   p'PyTuple_SetItem
    ,   c'PyTuple_SET_ITEM
    ,   p'PyTuple_SET_ITEM
    ,   c'PyTuple_Resize
    ,   p'PyTuple_Resize
    ,   c'PyTuple_ClearFreeList
    ,   p'PyTuple_ClearFreeList
    ) where

import Bindings.Python.Raw.Types

#strict_import

import Prelude ( IO )

#ccall PyTuple_Check, Ptr <PyObject> -> IO <int>

#ccall PyTuple_CheckExact, Ptr <PyObject> -> IO <int>

#ccall PyTuple_New, <Py_ssize_t> -> IO (Ptr <PyObject>)

-- | Need to figure out how to use the varargs list...
--
#ccall PyTuple_Pack, <Py_ssize_t> -> IO (Ptr <PyObject>)

#ccall PyTuple_Size, Ptr <PyObject> -> IO <Py_ssize_t>

#ccall PyTuple_GET_SIZE, Ptr <PyObject> -> IO <Py_ssize_t>

#ccall PyTuple_GetItem, Ptr <PyObject> -> <Py_ssize_t> -> IO (Ptr <PyObject>)

#ccall PyTuple_GET_ITEM, Ptr <PyObject> -> <Py_ssize_t> -> IO (Ptr <PyObject>)

#ccall PyTuple_GetSlice, Ptr <PyObject> -> <Py_ssize_t> -> <Py_ssize_t> -> IO (Ptr <PyObject>)

#ccall PyTuple_SetItem, Ptr <PyObject> -> <Py_ssize_t> -> Ptr <PyObject> -> IO <int>

#ccall PyTuple_SET_ITEM, Ptr <PyObject> -> <Py_ssize_t> -> Ptr <PyObject> -> IO <int>

#ccall PyTuple_Resize, Ptr (Ptr <PyObject>) -> <Py_ssize_t> -> Ptr <int>

#ccall PyTuple_ClearFreeList, IO <int>
