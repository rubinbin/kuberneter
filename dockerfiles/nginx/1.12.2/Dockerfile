FROM img.rubin.me/rulin/centos:7.4

COPY nginx-1.12.2-1.el7.centos.x86_64.rpm /

RUN  yum update -y      && \
     yum clean all      && \
     rpm -ivh /nginx-1.12.2-1.el7.centos.x86_64.rpm && \
     rm -f    /nginx-1.12.2-1.el7.centos.x86_64.rpm 
