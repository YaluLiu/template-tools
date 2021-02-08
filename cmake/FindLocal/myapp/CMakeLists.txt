set(TARGET_NAME myapp)
set(CMAKE_INSTALL_RPATH ${GOOD_PATH}/lib)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

add_executable(${TARGET_NAME} main.c)

find_library(LIBS
    NAMES mylib
    HINTS ${GOOD_PATH}/lib)

target_include_directories(${TARGET_NAME}
    PUBLIC ${GOOD_PATH}/include)

target_link_libraries(${TARGET_NAME}
    ${LIBS})


install(
  TARGETS ${TARGET_NAME}
  DESTINATION bin
)