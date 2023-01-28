#!/bin/bash

./build.sh -qt5 -expert -debug -j$CPU_COUNT

cd ${SRC_DIR}/bin-debug
cp klayout ${PREFIX}/bin/
cp -r * ${PREFIX}/lib
rm ${PREFIX}/lib/klayout
