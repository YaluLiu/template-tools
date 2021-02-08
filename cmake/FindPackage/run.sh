#!/usr/bin/env bash

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
good_path=${project_dir}/libs
build_dir=${project_dir}/build

function clean() {
    cd ${project_dir}
    rm -r ${build_dir}
    rm -r ${good_path}
    rm -r bin
}

function build_libs() {
    cmake -Hgood_print -B${build_dir}/good_print -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${good_path}  
    cmake --build ${build_dir}/good_print --target install
}

function build_exe() {
    cmake -Hmyapp -B${build_dir}/myapp -DCMAKE_INSTALL_PREFIX=${project_dir} -DGOOD_PATH=${good_path} -DCMAKE_PREFIX_PATH=${good_path}
    cmake --build ${build_dir}/myapp --target install
}

function run_exe() {
    ${project_dir}/bin/myapp
}

build_libs
build_exe
run_exe
clean








