#!/bin/bash

set -e
set -x

cd ${SRC_DIR}
./build.sh -build "${SRC_DIR}/build" -python "${PYTHON}" -expert -without-qtbinding -libpng -libexpat -dry-run

cd ${SRC_DIR}/build
make V=1 -j$CPU_COUNT
make V=1 install

cd ${SRC_DIR}/bin-release
cp -a klayout strm* ${PREFIX}/bin/
cp -a *.so* ${PREFIX}/lib/
cp -ar pymod *_plugins ${PREFIX}/lib/
