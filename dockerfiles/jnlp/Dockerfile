FROM img.rubin.me/rulin/alpine:3.7

#更新源站，安装jdk-8u151
RUN  apk update                     && \
     apk add "openjdk8~=8.191"      && \
     apk add openssh                && \
     apk add git