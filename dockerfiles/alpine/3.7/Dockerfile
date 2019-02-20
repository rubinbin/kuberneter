#指定基础镜像
FROM docker.io/alpine:3.7

#拷贝files目录到容器的根目录下面
COPY files    /

#更新索引，升级当前安装的包，安装curl包，添加用户www -D看不懂
RUN  apk update         && \
     apk upgrade        && \
     apk add sudo curl  && \
     adduser www -D
