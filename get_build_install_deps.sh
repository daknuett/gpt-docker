#!/bin/sh
git clone https://github.com/usqcd-software/c-lime.git
(cd c-lime && ./autogen.sh && ./configure && make && make install)
git clone https://github.com/lehner/Grid --branch feature/gpt
(cd Grid && ./bootstrap.sh)
(cd Grid/ && ./configure CXXFLAGS=-fPIC --enable-precision=double --enable-simd=AVX --enable-comms=none && cd Grid  && make version-cache Version.h && make && make install)
cp Grid/grid-config /usr/local/bin

