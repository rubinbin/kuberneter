#! /bin/sh

tf="/tmp/www.conf"
cf="/etc/php7/php-fpm.d/$(basename $tf)"

if [ -f $tf ]
then
    echo "Replace $cf by $tf"
    cp -fv $tf $cf
else
    echo "File not found: $tf"
    retval=1
fi

echo "Remove $0 for security"
rm -rf $0
exit $retval