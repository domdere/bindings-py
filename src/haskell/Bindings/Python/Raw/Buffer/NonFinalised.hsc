{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
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

import Bindings.Python.Raw.Types

#strict_import


