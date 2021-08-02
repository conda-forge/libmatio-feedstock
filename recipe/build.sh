#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./config

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" == "1" ]]; then
  # See https://github.com/tbeu/matio/issues/78#issuecomment-357797381
  MATIO_CROSS_COMPILATION_CONFIGURE_OPTS="--ac_cv_va_copy=C99"
else
  MATIO_CROSS_COMPILATION_CONFIGURE_OPTS=""
fi



./configure \
  --enable-mat73 \
  --with-pic \
  --enable-extended-sparse \
  --prefix="${PREFIX}" \
  --with-zlib="${PREFIX}" \
  --with-hdf5="${PREFIX}" ${MATIO_CROSS_COMPILATION_CONFIGURE_OPTS}
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
