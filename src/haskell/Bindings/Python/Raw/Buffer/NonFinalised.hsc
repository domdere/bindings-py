{-# LANGUAGE ForeignFunctionInterface #-}
#include <bindings.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Buffer.NonFinalised
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- The direct bindings to the Python C API for Buffers,
--
-- Refer to this: <https://docs.python.org/2/c-api/buffer.html>
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Buffer.NonFinalised where

import Bindings.Python.Raw.Buffer.Types
import Bindings.Python.Raw.Types

#strict_import

import Prelude ( IO )

#ccall PyObject_CheckBuffer, Ptr <Py_ssize_t> -> IO CInt

#ccall PyObject_GetBuffer, Ptr <Py_ssize_t> -> Ptr <Py_buffer> -> CInt -> IO CInt

#ccall PyBuffer_Release, Ptr <Py_buffer> -> IO ()

#ccall PyBuffer_SizeFromFormat, CString -> IO <Py_ssize_t>

#ccall PyBuffer_IsContiguous, Ptr <Py_buffer> -> CChar -> IO CInt

#ccall PyBuffer_FillContiguousStrides, CInt -> Ptr <Py_ssize_t> -> Ptr <Py_ssize_t> -> <Py_ssize_t> -> CChar -> IO ()

#ccall PyBuffer_FillInfo, Ptr <Py_buffer> -> Ptr <PyObject> -> Ptr () -> <Py_size_t> -> CInt -> CInt -> IO CInt
