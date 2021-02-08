
#ifndef MYLIB_EXPORT_H
#define MYLIB_EXPORT_H

#ifdef MYLIB_STATIC_DEFINE
#  define MYLIB_EXPORT
#  define MYLIB_NO_EXPORT
#else
#  ifndef MYLIB_EXPORT
#    ifdef mylib_EXPORTS
        /* We are building this library */
#      define MYLIB_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define MYLIB_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef MYLIB_NO_EXPORT
#    define MYLIB_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef MYLIB_DEPRECATED
#  define MYLIB_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef MYLIB_DEPRECATED_EXPORT
#  define MYLIB_DEPRECATED_EXPORT MYLIB_EXPORT MYLIB_DEPRECATED
#endif

#ifndef MYLIB_DEPRECATED_NO_EXPORT
#  define MYLIB_DEPRECATED_NO_EXPORT MYLIB_NO_EXPORT MYLIB_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef MYLIB_NO_DEPRECATED
#    define MYLIB_NO_DEPRECATED
#  endif
#endif

#endif /* MYLIB_EXPORT_H */
