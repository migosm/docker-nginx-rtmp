#!/bin/bash

git clone git://github.com/arut/nginx-rtmp-module.git
sudo docker build -t migosm/docker-nginx-rtmp .
