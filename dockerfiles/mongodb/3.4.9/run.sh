#! /bin/bash


if [ -z "$@" ]
then
    ef="/etc/mongodb.yaml"
    df="/mongodb/$(basename $ef)"

    test -d "/mongodb"  || mkdir "/mongodb"
    test -d "/log"      || mkdir "/log"

    log="/log/mongodb.log"
    test -f "$log"  || touch $log

    test -f $df     && f="$df" || f="$ef"

    echo "Using config: $f"
    mongod -f $f
else
    "$@"
fi

