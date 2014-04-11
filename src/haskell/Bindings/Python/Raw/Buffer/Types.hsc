{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Buffer.Types
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- Types from the Python C API for Buffers
--
-- Refer to this: <https://docs.python.org/2/c-api/buffer.html>
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Buffer.NonFinalised where

import Bindings.Python.Raw.Types

#strict_import

#starttype struct Py_buffer
#field buf, Ptr ()
#field len, <Py_ssize_t>
#field readonly, <int>
#field format, Ptr CChar
#stoptype
