#指定基础镜像
FROM img.rubin.me/rulin/alpine:3.7

#添加维护者信息
LABEL Maintainer="1275035607@qq.com"

#将run.sh拷贝到根目录下
COPY run.sh /

#更新索引，安装redis4.0.6，赋run.sh可执行权限
RUN  apk update             && \
     apk add "redis~=4.0.6" && \
     chmod -v 755 /run.sh

#启动容器时，运行这个脚本
CMD ["/run.sh"]
