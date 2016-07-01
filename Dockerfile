#
FROM muccg/python-base:debian8-2.7
MAINTAINER https://github.com/muccg/

COPY docker-entrypoint.sh /
COPY rotate-backups.py /
COPY rotate-backups.conf /etc/default/rotate-backups

RUN chmod +x /docker-entrypoint.sh /rotate-backups.py

RUN mkdir /working

VOLUME ["/backup", "/output"]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["backup"]
