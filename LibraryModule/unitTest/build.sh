#!/bin/bash

if [ ! -d "$DIRECTORY" ]; then
  mkdir build
fi
cd build
cmake ../
make
make install
LD_LIBRARY_PATH=../build/
export LD_LIBRARY_PATH
