#!/usr/bin/env bash

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
good_path=${project_dir}/libs
build_dir=${project_dir}/_build

function make_build_dir() {
    mkdir -p ${build_dir}
}

function clean() {
    cd ${project_dir}
    rm -r ${build_dir}
    rm -r ${good_path}
}

function build() {
    if [ -e "$build_dir/CMakeCache.txt" ]; then
        rm -rf "$build_dir/CMakeCache.txt"
    fi
    cmake -H. -B${build_dir} -DCMAKE_INSTALL_PREFIX=${good_path}  
    cmake --build ${build_dir} --target install
}

function run_exe() {
    ${good_path}/bin/myapp
}

make_build_dir
build
run_exe
clean

