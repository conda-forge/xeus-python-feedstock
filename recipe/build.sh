#!/bin/bash

if [[ ${target_platform} == linux-ppc64le ]]; then
  cmake -DCMAKE_BUILD_TYPE=Release     \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DXPYT_DISABLE_TUNE_GENERIC=ON \
        -DCMAKE_INSTALL_LIBDIR=lib     \
        -DPYTHON_EXECUTABLE=$PYTHON    \
        $SRC_DIR
else
  cmake -DCMAKE_BUILD_TYPE=Release     \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DXPYT_DISABLE_ARCH_NATIVE=ON  \
        -DCMAKE_INSTALL_LIBDIR=lib     \
        -DPYTHON_EXECUTABLE=$PYTHON    \
        $SRC_DIR
fi

make install
