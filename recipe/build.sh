#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./config

./configure \
  --enable-mat73 \
  --with-pic \
  --enable-extended-sparse \
  --prefix="${PREFIX}" \
  --with-zlib="${PREFIX}" \
  --with-hdf5="${PREFIX}"
make

if [[ `uname` == 'Darwin' ]];
then
	eval DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib make check
else
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
	make check
fi
fi

make install
