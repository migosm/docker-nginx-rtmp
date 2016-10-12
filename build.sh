#!/bin/bash

mkdir -p build
git clone git://github.com/arut/nginx-rtmp-module.git build/nginx-rtmp-module
git clone https://github.com/FFmpeg/FFmpeg.git  build/FFmpeg
git clone git://git.videolan.org/x264.git build/x264
pushd build/FFmpeg
  git checkout release/3.1
popd
sudo docker build --no-cache=true -t migosm/docker-nginx-rtmp .
