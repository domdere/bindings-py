-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.Python.Lists
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- The direct bindings to the Python C API for lists,
--
-- Refer to this: <https://docs.python.org/2/c-api/list.html>
--
-----------------------------------------------------------------
module Bindings.Python.Raw.Python.Lists
    (   c'PyList_Check
    ,   p'PyList_Check
    ) where

import Bindings.Python.Raw.Python.Lists.NonFinalised
