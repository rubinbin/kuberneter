#! /bin/bash

if [ -z "$@" ]
then
    echo "Start Nginx"
    /usr/local/nginx/sbin/nginx
else
    "$@"
fi
