set(TARGET_NAME myapp)
set(LIBS mylib)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

add_executable(${TARGET_NAME} main.c)

add_dependencies(${TARGET_NAME}
    ${LIBS}
)

target_include_directories(${TARGET_NAME}
    PUBLIC ../good_print)

target_link_libraries(${TARGET_NAME}
    ${LIBS})


install(TARGETS ${TARGET_NAME} DESTINATION bin)
