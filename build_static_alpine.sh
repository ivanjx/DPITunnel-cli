#!/bin/ash
cmake -B./build -DCMAKE_BUILD_TYPE=RELEASE -DSTATIC_BINARY=true .
make -C ./build -j $(nproc)
