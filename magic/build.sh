#!/bin/bash

set -e
set -x

./configure --prefix="${PREFIX}" --with-cairo="${BUILD_PREFIX}/include"

make V=1 -j$CPU_COUNT

make V=1 install
