#! /bin/sh

#定义Memcached的端口，运行内存，并发链接数量，这里设置的是使用环境变量的信息
port=$MEMCACHED_PORT
max_mem=$MEMCACHED_MAX_MEM
max_conn=$MEMCACHED_MAX_CONN

#加入环境变量没有定义，这里就是手动设置的
test -z "$port"     &&     port=11211
test -z "$max_mem"  &&  max_mem=64
test -z "$max_conn" && max_conn=1024

#判断$@是否为空，空为真，为真实，输出启动memcached，然后将端口信息，内存，并发链接数输出，最后启动memcached
if [ -z "$@" ]
then
    echo "Start memceched with options: port $port, max mempry $max_mem, max connection $max_conn"
    memcached -m $max_mem -u nobody -p $port -c $max_conn
else
    "$@"
fi
