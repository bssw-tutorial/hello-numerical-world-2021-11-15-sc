inst="$PWD/inst"

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$inst ..
make -j
make install
