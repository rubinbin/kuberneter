#! /bin/sh

#查看环境变量中是否有定义，然后进行赋值
port="`env | grep MEMCACHED_PORT     | awk -F '=' '{print $2}'`"
max_mem="`env | grep MEMCACHED_MAX_MEM  | awk -F '=' '{print $2}'`"
max_conn="`env | grep MEMCACHED_MAX_CONN | awk -F '=' '{print $2}'`"

#判断memcached端口，内存，并发是否赋值成功，没成功则再次定义赋值
test -z "$port"     && port=11211
test -z "$max_mem"  && max_mem=512
test -z "$max_conn" && max_conn=1024

#$@为空，启动memcached
if [ -z "$@" ]
then
    memcached -m $max_mem -u nobody -p $port -c $max_conn
else
    "$@"
fi
