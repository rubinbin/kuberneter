#!/bin/sh


#判读传参的参数字符串是否为空，空为真，定义redis配置文件变量，然后进行配置修改，并启动容器，为假时，看不懂
if [ -z "$@" ]
then
    config=/etc/redis.conf

    # Set bind address to '0.0.0.0'
    sed -i 's/^bind .*/bind 0.0.0.0/'       $config

    # Set daemonize to 'no'
    sed -i 's/^daemonize .*/daemonize no/'  $config

    # Start Redis Server
    redis-server $config
else
    "$@"
fi
