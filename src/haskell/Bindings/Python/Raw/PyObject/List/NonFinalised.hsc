{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.h>

-----------------------------------------------------------------
-- |
-- Module       : Bindings.Python.Raw.PyObject.List.NonFinalised
-- Copyright    : (C) 2014 Dom De Re
-- License      : BSD-style (see the file etc/LICENSE.md)
-- Maintainer   : Dom De Re
--
-- The direct bindings to the Python C API for lists,
--
-- Refer to this: <https://docs.python.org/2/c-api/list.html>
--
-----------------------------------------------------------------
module Bindings.Python.Raw.PyObject.List.NonFinalised
    (   c'PyList_Check
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

import Bindings.Python.Raw.Types

#strict_import
import Data.Bits

-- | Return True if the PythonObj is a list object or an instance of a subtype of the list type
--
#ccall PyList_Check, Ptr <PyObject> -> IO Bool

-- | Return true if the PythonObj is a list object, but not an instance of a subtype of the list type.
--
#ccall PyList_CheckExact, Ptr <PyObject> -> IO Bool

-- | Return a new list of the given length on success, or NULL on failure.
--
#ccall PyList_New, <Py_ssize_t> -> IO (Ptr <PyObject>)

-- | Return the length of a list; this is equivalent to len(list) on a list object.
--
#ccall PyList_Size, Ptr <PyObject> -> IO <Py_ssize_t>

-- | Return the object at position index in the list pointed to by list. The position must be positive, indexing from the end of the list is not supported. If index is 
-- out of bounds, an IndexError exception is thrown.
--
#ccall PyList_GetItem, Ptr <PyObject> -> <Py_ssize_t> -> Ptr <PyObject>

-- | Set the item at index index in list to item. Return 0 on success or -1 on failure.
-- first `PyObject` is the list, the second is the item
#ccall PyList_SetItem, Ptr <PyObject> -> <Py_ssize_t> -> Ptr <PyObject> -> IO <int>

-- | Insert the item item into list list in front of index index. Return 0 if successful; return -1 and set an exception if unsuccessful. Analogous to
-- `list.insert(index, item)`. The first PyObject is the list and the second is the item.
--
#ccall PyList_Insert, Ptr <PyObject> -> <Py_ssize_t> -> Ptr <PyObject> -> IO <int>

-- | Append the object item at the end of list list. Return 0 if successful; return -1 and set an exception if unsuccessful. Analogous to list.append(item).
-- First PyObject is the list the second is the item to append.
--
#ccall PyList_Append, Ptr <PyObject> -> Ptr <PyObject> -> IO <int>

-- | Return a list of the objects in list containing the objects between low and high. Return NULL and set an exception if unsuccessful. Analogous to
-- list[low:high]. Negative indices, as when slicing from Python, are not supported.
-- the PyObject is the list to slice, the first the Py_ssize_t is the low index while the second is the high index.
#ccall PyList_GetSlice, Ptr <PyObject> -> <Py_ssize_t> -> <Py_ssize_t> -> IO (Ptr <PyObject>)

-- | Set the slice of list between low and high to the contents of itemlist. Analogous to list[low:high] = itemlist. The itemlist may be NULL, indicating the
-- assignment of an empty list (slice deletion). Return 0 on success, -1 on failure. Negative indices, as when slicing from Python, are not supported.
--
#ccall PyList_SetSlice, Ptr <PyObject> -> <Py_ssize_t> -> <Py_ssize_t> -> Ptr <PyObject> -> IO <int>

-- | Sort the items of list in place. Return 0 on success, -1 on failure. This is equivalent to list.sort().
--
#ccall PyList_Sort, Ptr <PyObject> -> IO <int>

-- | Reverse the items of list in place. Return 0 on success, -1 on failure. This is the equivalent of list.reverse().
--
#ccall PyList_Reverse, Ptr <PyObject> -> IO <int>

-- | Return a new tuple object containing the contents of list; equivalent to tuple(list).
--
#ccall PyList_AsTuple, Ptr <PyObject> -> IO (Ptr <PyObject>)
