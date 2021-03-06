FROM anapsix/alpine-java:8u172b11_jdk

MAINTAINER François Brulotte <francois.brulotte@gmail.com>

ENV TEAMCITY_AGENT_DIR /opt/agent

VOLUME $TEAMCITY_AGENT_DIR/conf

# Install latest version of Docker
RUN echo "@community http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk --update --no-cache add docker@community

# Install Docker Compose
RUN apk add --no-cache --virtual .build-deps curl && \
    curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apk del .build-deps

# Install git for agent check-out
RUN apk add --no-cache git

# Allow automatic ECR login using existing AWS credential
COPY docker-credential-ecr-login /usr/local/bin/docker-credential-ecr-login
RUN chmod +x /usr/local/bin/docker-credential-ecr-login

# Entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR $TEAMCITY_AGENT_DIR

EXPOSE 9090

ENTRYPOINT ["/entrypoint.sh"]
