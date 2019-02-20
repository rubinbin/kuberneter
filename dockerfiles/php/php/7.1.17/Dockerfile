FROM img.rubin.me/library/alpine:3.7

ENV SYSTEM_CMDS="sudo"                                \
    BUILD_TOOLS="m4 autoconf gcc g++ make file bash"  \
    PHP_LOG="/data/logs/php"                          \
    PHP_VERSION="7.1.17"                              \
    PHP_YAF_V="3.0.6"                                 \
    PHP_REDIS_V="3.1.4"                               \
    PHP_DEPS="libxml2 libxml2-dev openssl openssl-dev           \
              bzip2 bzip2-dev libcurl curl-dev re2c libevent    \
              libjpeg-turbo libjpeg-turbo-dev libpng libpng-dev \
              libevent-dev                                      \
              freetype freetype-dev readline readline-dev       \
              libmcrypt libmcrypt-dev libxslt libxslt-dev"
ENV PHP_REDIS="php7-redis~=$PHP_REDIS_V"                        \
    PHP_EXTS="bcmath bz2 calendar ctype curl dba dom exif       \
              fileinfo gd gettext gmp iconv json mbstring       \
              mcrypt mysqli pdo_mysql pdo_sqlite pcntl phar     \
              posix shmop simplexml soap sockets sqlite3        \
              sysvmsg sysvshm sysvsem tokenizer wddx opcache    \
              xml xmlreader xmlwriter xmlrpc xsl zip pear"      \
    PHP_PKGS="php7~=$PHP_VERSION php7-dev~=$PHP_VERSION php7-fpm~=$PHP_VERSION"

RUN apk update                                  && \
    apk upgrade                                 && \
    apk add $SYSTEM_CMDS                        && \
    apk add $PHP_DEPS $BUILD_TOOLS              && \
    apk add $PHP_PKGS $PHP_REDIS                && \
    mkdir /t && cd /t                           && \
    for i in $PHP_EXTS;do apk add php7-$i;done  && \
    curl -jkLO http://pecl.php.net/get/yaf-${PHP_YAF_V}.tgz             && \
    tar zxf yaf-${PHP_YAF_V}.tgz                && \
    cd yaf-${PHP_YAF_V}                         && \
    phpize                                      && \
    ./configure --with-php-config=php-config    && \
    make && make install && cd /t               && \
    curl -OL https://github.com/edenhill/librdkafka/archive/v0.11.4.tar.gz  && \
    tar zxf v0.11.4.tar.gz                      && \
    cd librdkafka-0.11.4                        && \
    ./configure && make && make install         && \
    cd /t && curl -o php-rdkafka-php7.zip          \
    https://codeload.github.com/arnaud-lb/php-rdkafka/zip/php7          && \
    unzip php-rdkafka-php7.zip && cd php-rdkafka-php7                   && \
    phpize                                      && \
    ./configure --with-php-config=php-config    && \
    make && make install && cd /t               && \
    curl -OL http://pecl.php.net/get/swoole-2.1.3.tgz                   && \
    tar zxf swoole-2.1.3.tgz                    && \
    cd swoole-2.1.3                             && \
    phpize                                      && \
    ./configure --with-php-config=php-config    && \
    make && make install && cd /t               && \
    curl -OL http://pecl.php.net/get/nsq-2.3.2.tgz                      && \
    tar zxf nsq-2.3.2.tgz                       && \
    cd nsq-2.3.2                                && \
    phpize                                      && \
    ./configure --with-php-config=php-config    && \
    make && make install && cd /                && \
    pecl install mongodb                        && \
    apk del $BUILD_TOOLS                        && \
    test -d "$PHP_LOG" || mkdir -p "$PHP_LOG"   && \
    rm -rf /t /tmp/*                            && \
    touch $PHP_LOG/php-fpm.log                     \
          $PHP_LOG/php-slow.log

COPY files /

RUN setfacl -Rm u:work:rwx /etc/php7/php-fpm.d  && \
    chown -R nobody:nobody $PHP_LOG             && \
    chmod 755 /run.sh /update-file.sh

ENV SYSTEM_CMDS=""  BUILD_TOOLS=""   PHP_YAF_V=""  \
    PHP_REDIS_V=""  PHP_DEPS=""      PHP_REDIS=""  \
    PHP_EXTS=""     PHP_PKGS=""

ENTRYPOINT ["/run.sh"]
