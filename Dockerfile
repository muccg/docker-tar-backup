FROM muccg/python-base:2.7-alpine
MAINTAINER https://github.com/muccg/

RUN apk add --no-cache \
    bash \
    openssl \
    tar

COPY rootfs/ /

RUN mkdir /working

VOLUME ["/backup", "/output"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["backup"]
