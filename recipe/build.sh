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

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
if [[ `uname` == 'Darwin' ]];
then
	eval DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib make check
else
	make check
fi
fi

make install
