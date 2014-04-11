-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-----------------------------------------------------------------
module Bindings.Python.Raw (
    -- * Initialisation
        c'Py_Initialize
    ,   p'Py_Initialize
    -- * Reference Counting
    ,   c'Py_XINCREF
    ,   p'Py_XINCREF
    ,   c'Py_XDECREF
    ,   p'Py_XDECREF
    -- * PyObject Functions
    -- ** List Functions
    ,   c'PyList_Check
    ,   p'PyList_Check
    ,   c'PyList_CheckExact
    ,   p'PyList_CheckExact
    ,   c'PyList_New
    ,   p'PyList_New
    ,   c'PyList_Size
    ,   p'PyList_Size
    ,   c'PyList_GetItem
    ,   p'PyList_GetItem
    ,   c'PyList_SetItem
    ,   p'PyList_SetItem
    ,   c'PyList_Insert
    ,   p'PyList_Insert
    ,   c'PyList_Append
    ,   p'PyList_Append
    ,   c'PyList_GetSlice
    ,   p'PyList_GetSlice
    ,   c'PyList_SetSlice
    ,   p'PyList_SetSlice
    ,   c'PyList_Sort
    ,   p'PyList_Sort
    ,   c'PyList_Reverse
    ,   p'PyList_Reverse
    ,   c'PyList_AsTuple
    ,   p'PyList_AsTuple
    ) where

import Bindings.Python.Raw.Initialize
import Bindings.Python.Raw.PyObject
import Bindings.Python.Raw.ReferenceCounting
import Bindings.Python.Raw.Types

