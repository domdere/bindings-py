{-# LANGUAGE ForeignFunctionInterface, GeneralizedNewtypeDeriving #-}
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
module Bindings.Python.Raw.Buffer.Types(
    -- * Buffer Data Type
        C'Py_buffer(..)
    -- * Flags for PyObject_GetBuffer
    ,   PyGetBufferFlag
    ,   pyBufSimple
    ,   pyBufWritable
    ,   pyBufStrides
    ,   pyBufND
    ,   pyBufCContiguous
    ,   pyBufFContiguous
    ,   pyBufAnyContiguous
    ,   pyBufIndirect
    ,   pyBufFormat
    ,   pyBufStrided
    ,   pyBufStridedRO
    ,   pyBufRecords
    ,   pyBufRecordsRO
    ,   pyBufFull
    ,   pyBufFullRO
    ,   pyBufContig
    ,   pyBufContigRO
    ) where

import Bindings.Python.Raw.Types

#strict_import

import Prelude ( Eq, Num, Show, ($) )
import Control.Monad ( return )
import Data.Bits ( (.|.) )
import Data.Function ( on )
import Data.Monoid ( Monoid(..) )

#starttype Py_buffer
#field buf, Ptr ()
#field len, <Py_ssize_t>
#field readonly, CInt
#field format, Ptr CChar
#field ndim, CInt
#field shape, Ptr <Py_ssize_t>
#field strides, Ptr <Py_ssize_t>
#field suboffsets, Ptr <Py_ssize_t>
#field itemsize, <Py_ssize_t>
#field internal, Ptr ()
#stoptype

#num PyBUF_SIMPLE
#num PyBUF_WRITABLE
#num PyBUF_STRIDES
#num PyBUF_ND
#num PyBUF_C_CONTIGUOUS
#num PyBUF_F_CONTIGUOUS
#num PyBUF_ANY_CONTIGUOUS
#num PyBUF_INDIRECT
#num PyBUF_FORMAT
#num PyBUF_STRIDED
#num PyBUF_STRIDED_RO
#num PyBUF_RECORDS
#num PyBUF_RECORDS_RO
#num PyBUF_FULL
#num PyBUF_FULL_RO
#num PyBUF_CONTIG
#num PyBUF_CONTIG_RO

newtype PyGetBufferFlag = PyGetBufferFlag CInt deriving (Eq, Storable)

pyBufSimple :: PyGetBufferFlag
pyBufSimple = PyGetBufferFlag c'PyBUF_SIMPLE

pyBufWritable :: PyGetBufferFlag
pyBufWritable = PyGetBufferFlag c'PyBUF_WRITABLE

pyBufStrides :: PyGetBufferFlag
pyBufStrides = PyGetBufferFlag c'PyBUF_STRIDES

pyBufND :: PyGetBufferFlag
pyBufND = PyGetBufferFlag c'PyBUF_ND

pyBufCContiguous :: PyGetBufferFlag
pyBufCContiguous = PyGetBufferFlag c'PyBUF_C_CONTIGUOUS

pyBufFContiguous :: PyGetBufferFlag
pyBufFContiguous = PyGetBufferFlag c'PyBUF_F_CONTIGUOUS

pyBufAnyContiguous :: PyGetBufferFlag
pyBufAnyContiguous = PyGetBufferFlag c'PyBUF_ANY_CONTIGUOUS

pyBufIndirect :: PyGetBufferFlag
pyBufIndirect = PyGetBufferFlag c'PyBUF_INDIRECT

pyBufFormat :: PyGetBufferFlag
pyBufFormat = PyGetBufferFlag c'PyBUF_FORMAT

pyBufStrided :: PyGetBufferFlag
pyBufStrided = PyGetBufferFlag c'PyBUF_STRIDED

pyBufStridedRO :: PyGetBufferFlag
pyBufStridedRO = PyGetBufferFlag c'PyBUF_STRIDED_RO

pyBufRecords :: PyGetBufferFlag
pyBufRecords = PyGetBufferFlag c'PyBUF_RECORDS

pyBufRecordsRO :: PyGetBufferFlag
pyBufRecordsRO = PyGetBufferFlag c'PyBUF_RECORDS_RO

pyBufFull :: PyGetBufferFlag
pyBufFull = PyGetBufferFlag c'PyBUF_FULL

pyBufFullRO :: PyGetBufferFlag
pyBufFullRO = PyGetBufferFlag c'PyBUF_FULL_RO

pyBufContig :: PyGetBufferFlag
pyBufContig = PyGetBufferFlag c'PyBUF_CONTIG

pyBufContigRO :: PyGetBufferFlag
pyBufContigRO = PyGetBufferFlag c'PyBUF_CONTIG_RO

-- instances

instance Monoid PyGetBufferFlag where
    mempty = PyGetBufferFlag 0

    x `mappend` y = PyGetBufferFlag $ x `or` y

-- helpers

fromPyGetBufferFlag :: PyGetBufferFlag -> CInt
fromPyGetBufferFlag (PyGetBufferFlag x) = x

or :: PyGetBufferFlag -> PyGetBufferFlag -> CInt
or = (.|.) `on` fromPyGetBufferFlag
