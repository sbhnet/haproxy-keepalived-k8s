FROM haproxy:1.8.9

MAINTAINER whq <krman@163.com>

COPY docker-entrypoint.sh /
RUN  chmod +x /docker-entrypoint.sh

COPY haproxy.cfg /usr/local/etc/haproxy/

