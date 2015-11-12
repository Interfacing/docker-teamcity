FROM frolvlad/alpine-oraclejdk8

MAINTAINER François Brulotte <francois.brulotte@gmail.com>

ENV TEAMCITY_AGENT_DIR "/opt/agent"

RUN addgroup teamcity && \
    adduser -D -s /sbin/nologin -G teamcity teamcity && \
    mkdir -p $TEAMCITY_AGENT_DIR && \
    chown teamcity:teamcity $TEAMCITY_AGENT_DIR

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER teamcity
WORKDIR $TEAMCITY_AGENT_DIR

EXPOSE 9090

ENTRYPOINT ["/entrypoint.sh"]
