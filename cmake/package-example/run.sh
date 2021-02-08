#!/usr/bin/env bash

project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
build_dir=${project_dir}/build
lib_dir=${project_dir}/libs


function clean() {
    rm -r ${build_dir}
    rm -r ${lib_dir}
}

function build_Foo() {
    cmake -HFoo -B${build_dir}/Foo-release -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${lib_dir} 
    cmake --build ${build_dir}/Foo-release --target install
}

function build_Boo() {
    cmake -HBoo -B${build_dir}/Boo  -DCMAKE_INSTALL_PREFIX=${lib_dir}
    cmake --build ${build_dir}/Boo
}

function run_exe() {
    ${build_dir}/Boo/boo
}

build_Foo
build_Boo
run_exe
clean

