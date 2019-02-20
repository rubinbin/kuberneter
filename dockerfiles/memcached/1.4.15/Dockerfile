#设置基础镜像
FROM img.rubin.me/rulin/centos:7.4

#设置维护者信息
LABEL MAINTAINER="1275035607@qq.com"

#复制run.sh到容器中
ADD run.sh    /

#yum安装memcached，并赋可执行权限
RUN yum update -y             && \
    yum install -y memcached  && \
    yum clean all             && \
    chmod 755 /run.sh

#容器启动时执行run.sh脚本
ENTRYPOINT ["/run.sh"]
