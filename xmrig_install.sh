#!/bin/bash

sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
git clone https://github.com/xmrig/xmrig.git && cd xmrig
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j8
