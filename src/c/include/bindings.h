#ifndef __BINDINGS_H__
#define __BINDINGS_H__

#include <bindings.dsl.h>
#include <mangle.h>

#include <Python.h>

// Macros

#define hsc_newtype(t,derive...)                                \
    {                                                           \
        printf("newtype ");                                     \
        hsc_mangle_tycon(# t);                                  \
        printf(" = ");                                          \
        hsc_mangle_datacon(# t);                                \
        printf(" ");                                            \
        hsc_type(t);                                            \
        { char *derives = # derive;                             \
            printf(" deriving (Storable, Show%s%s)\n",          \
                strlen(derives) > 0 ? ", " : "",                \
                derives);                                       \
        }                                                       \
    }

#endif // __BINDINGS_H__
