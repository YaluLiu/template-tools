#!/usr/bin/env bash

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
good_path=${project_dir}/libs
build_dir="build"

echo $project_dir

function make_build_dir() {
    mkdir -p ${build_dir}
}

function clean() {
    cd ${project_dir}
    rm -r ${build_dir}
    rm -r ${good_path}
    rm -r bin
}

function build_libs() {
    cd ${build_dir}
    rm -r *
    cmake -DCMAKE_INSTALL_PREFIX=${good_path}  ../good_print
    cmake --build . --target install
}

function build_exe() {
    cd ${build_dir}
    rm -r *
    cmake -DCMAKE_INSTALL_PREFIX=${project_dir} -DGOOD_PATH=${good_path} ../myapp
    cmake --build . --target install
}

function run_exe() {
    # run 
    cd ${project_dir}
    ./bin/myapp
}

make_build_dir
build_libs
build_exe
run_exe
clean








