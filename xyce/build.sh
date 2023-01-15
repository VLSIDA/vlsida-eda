./bootstrap

mkdir -p build
cd build

../configure \
  CXXFLAGS="-O3 -std=c++11 -ldl" \
  ARCHDIR="$PREFIX" \
  CPPFLAGS="-I$PREFIX -ldl" \
  --enable-mpi CXX=mpicxx CC=mpicc F77=mpif77 \
  --prefix=$PREFIX \
  --enable-shared \
  --enable-xyce-shareable

make -j$CPU_COUNT install
