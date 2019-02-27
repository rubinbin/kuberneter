FROM docker.io/alpine:3.7

COPY files    /

#更新索引，升级当前安装的包，安装curl包
RUN  apk update         && \
     apk upgrade        && \
     apk add sudo curl
