FROM alpine:3.7
MAINTAINER whq <krman@163.com>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk --update -t add keepalived iproute2 grep bash tcpdump sed && rm -f /var/cache/apk/* /tmp/*
COPY keepalived.sh /usr/bin/keepalived.sh
COPY keepalived.conf /etc/keepalived/keepalived.conf
RUN chmod +x /usr/bin/keepalived.sh
ENTRYPOINT ["/usr/bin/keepalived.sh"]


# https://mirrors.ustc.edu.cn/alpine/v3.7/community/x86_64/

# https://hub.docker.com/r/wise2c/keepalived-k8s

# https://github.com/wise2c-devops/keepalived-k8s