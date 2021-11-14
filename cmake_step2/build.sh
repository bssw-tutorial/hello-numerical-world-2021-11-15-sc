inst="$PWD/inst"

mkdir -p build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$inst ..
make -j

(cd tests && ctest)
make install
