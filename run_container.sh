#!/bin/bash

case $1 in
  start)
    sudo docker run -td \
      -p 80:80 \
      -p 1935:1935 \
      --name=nr1 \
      -v /opt/data:/data \
      -v /opt/configs/nginx:/etc/nginx \
      migosm/docker-nginx-rtmp \
      bash
  ;;
esac
