#! /bin/bash
# /health_check.sh --url /test --port 8080 --host localhost --code 302
for arg in "$@"
do
    case $arg in
        --url)      url="$2"
                    shift 2
                    ;;
        --port)     port=$2
                    shift 2
                    ;;
        --host)     host="$2"
                    shift 2
                    ;;
        --code)     code=$2
                    shift 2
                    ;;
        --maxtime)  maxtime="--max-time $2"
                    shift 2
                    ;;
    esac
done
#判断$port和$host的值是否为空，为空就赋值
test -z "$port" && port=80
test -z "$host" && host="localhost"
#curl网站的状态码，并将状态码复制给$http_code
http_code=`curl --connect-timeout 5 $host:$port$url $maxtime -w %{http_code} -sq -o /dev/null`

if [ -z "$code" ]
then
    #状态码大于等于200且小于等于399
    if [ $http_code -ge 200 ] && [ $http_code -le 399 ]
    then
        exit 0
    else
        exit 1
    fi
else
    test $code = $http_code && exit 0 || exit 1
fi
