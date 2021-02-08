add_library(mylib  SHARED
    mylib.c mylib.h)

install(TARGETS mylib
    EXPORT mylib-targets
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

# install(EXPORT mylib-targets
#     FILE mylib-config.cmake
#     DESTINATION lib/cmake/mylib
# )

install(FILES mylib.h 
    DESTINATION include)