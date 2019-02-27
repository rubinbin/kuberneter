FROM daocloud.io/centos:7

#作者信息
LABEL MAINTAINER=1275035607@qq.com

#定位时区
#增加epel源
#安装常用软件
#更新所有软件
#清空yum所有缓存
#清除安装信息日志
RUN ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/epel-release-latest-7.noarch.rpm && \
    yum install -y net-tools vim ntpdate && \
    yum update  -y                  && \
    yum clean all                   && \
    rm -rf /var/log/anaconda /anaconda-post.log /var/lib/yum
