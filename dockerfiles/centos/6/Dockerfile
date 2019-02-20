###################################################
# date：2018-04-24
#
#
###################################################

#基础镜像
FROM daocloud.io/centos:6

#作者信息
LABEL MAINTAINER=1275035607@qq.com

#定位时区
#增加epel源
#更新所有软件
#清空yum所有缓存
#清除安装信息日志
RUN ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/epel-release-latest-6.noarch.rpm && \
    yum update  -y                  && \
    yum clean all                   && \
    rm -rf /var/log/anaconda /anaconda-post.log /var/lib/yum
