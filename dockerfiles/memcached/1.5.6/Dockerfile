#设置基础镜像
FROM img.rubin.me/rulin/alpine:3.7

#设置维护者信息
LABEL MAINTAINER="1275035607@qq.com"

#复制run.sh到容器中
ADD run.sh    /

#升级安装的包，更新索引，安装memcacehd_1.5.6，赋run.sh可执行权限
RUN apk upgrade                 && \
    apk update                  && \
    apk add "memcached~=1.5.6"  && \
    chmod 755 /run.sh

#容器启动时间执行run.sh
ENTRYPOINT ["/run.sh"]
