#!/bin/bash

git clone git://github.com/arut/nginx-rtmp-module.git
git clone https://github.com/FFmpeg/FFmpeg.git
pushd FFmpeg
  git checkout release/3.1
popd
sudo docker build --no-cache=true -t migosm/docker-nginx-rtmp .
