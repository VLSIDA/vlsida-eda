#!/bin/bash

set -e
set -x

./configure \
	--prefix="${PREFIX}" \
	--with-tk="${PREFIX}" \
	--with-tcl="${PREFIX}" \
	--x-includes="${PREFIX}" \
	--x-libraries="${PREFIX}"

make V=1 -j$NUM_CORES || exit 1

make V=1 install || exit 1
