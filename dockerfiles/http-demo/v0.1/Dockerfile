FROM img.rubin.me/library/nginx:1.12.2

COPY files  /

RUN  yum update -y      && \
     yum clean all      && \
     chmod 755 /run.sh /health_check.sh

ENTRYPOINT ["/run.sh"]
