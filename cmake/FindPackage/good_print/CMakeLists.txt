cmake_minimum_required(VERSION 3.16)
project(mylib)
add_library(mylib  SHARED
    mylib.c mylib.h)

# Introduce variables:
# * CMAKE_INSTALL_LIBDIR
# * CMAKE_INSTALL_BINDIR
# * CMAKE_INSTALL_INCLUDEDIR
include(GNUInstallDirs)


# https://cmake.org/cmake/help/v3.9/module/GenerateExportHeader.html
include(GenerateExportHeader)
generate_export_header(mylib EXPORT_FILE_NAME  ${PROJECT_SOURCE_DIR}/mylib.h)

set(TARGETS_EXPORT_CMAKE "${PROJECT_NAME}Config")
set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")

install(TARGETS mylib
    EXPORT ${TARGETS_EXPORT_CMAKE}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

install(EXPORT  ${TARGETS_EXPORT_CMAKE}
    DESTINATION ${config_install_dir}
)

install(FILES mylib.h 
    DESTINATION include)