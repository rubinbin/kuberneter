#! /bin/sh

if [ -z "$@" ]
then

    uid=`id | awk -F '(' '{print $1}' | awk -F '=' '{print $2}'`
    # Alpine
    test $uid = 0 && sudo="" || sudo="sudo"

    # PHP_MAX_PROC not empty and larger than 4
    if [ ! -z "$PHP_MAX_PROC" ] && [ $PHP_MAX_PROC -gt 4 ]
    then
        tf="/tmp/www.conf"
        cf="/etc/php7/php-fpm.d/$(basename $tf)"
        
        cp -rf $cf $tf

        test -z "$PHP_MIN_PROC"      && PHP_MIN_PROC="$(($PHP_MAX_PROC/4))"
        test     $PHP_MIN_PROC -le 2 && PHP_MIN_PROC=2

        sed -i "s/pm.max_children = .*/pm.max_children = $PHP_MAX_PROC/"            $tf
        sed -i "s/pm.start_servers = .*/pm.start_servers = $PHP_MIN_PROC/"          $tf
        sed -i "s/pm.min_spare_servers = .*/pm.min_spare_servers = $PHP_MIN_PROC/"  $tf
        sed -i "s/pm.max_spare_servers = .*/pm.max_spare_servers = $PHP_MAX_PROC/"  $tf

        echo "Use update-file.sh to replace $cf by $tf"
        $sudo /update-file.sh
        test $? = 0 || exit 1
    fi
    
    $sudo /usr/sbin/php-fpm7
else
    "$@"
fi