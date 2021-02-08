set(CMAKE_DEBUG_POSTFIX d)

add_library(mylib  SHARED
    mylib.c mylib.h)

# target_include_directories(mylib PUBLIC
#     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#     $<INSTALL_INTERFACE:include>
# )

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

install(FILES mylib.h DESTINATION include)