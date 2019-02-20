FROM img.rubin.me/rubin/centos:7

COPY run.sh             /
COPY init.password.sql  /

RUN yum update  -y  && \
    yum install -y libaio-devel numactl-libs && \
    yum clean all   && \
    rpm -ivh https://mirrors.tuna.tsinghua.edu.cn/mysql/downloads/MySQL-5.7/mysql-community-server-minimal-5.7.21-1.el7.x86_64.rpm && \
    chmod 755  /run.sh && rm -rf /var/lib/mysql

COPY my.cnf             /etc/
ENTRYPOINT ["/run.sh"]
