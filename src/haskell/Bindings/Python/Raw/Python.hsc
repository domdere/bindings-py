{-# LANGUAGE ForeignFunctionInterface #-}
-- #include "bindings.h"
#include <bindings.dsl.h>
-- #include <Python.h>

module Bindings.Python.Raw.Python where
#strict_import

-- #ccall Py_Initialize    , IO ()
