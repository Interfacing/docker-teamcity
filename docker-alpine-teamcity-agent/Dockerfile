FROM frolvlad/alpine-oraclejdk8

MAINTAINER François Brulotte <francois.brulotte@gmail.com>

ENV TEAMCITY_AGENT_DIR "/opt/agent"

RUN echo "@community http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update add docker@community && \
    rm /var/cache/apk/*

RUN curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR $TEAMCITY_AGENT_DIR

EXPOSE 9090

ENTRYPOINT ["/entrypoint.sh"]
