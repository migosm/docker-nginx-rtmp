#!/bin/bash

chmod -R 777 /data/
nginx -t
if [ $? == 0 ];then
    nginx
    tail -f
fi
