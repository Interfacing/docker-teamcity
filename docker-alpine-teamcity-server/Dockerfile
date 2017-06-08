FROM frolvlad/alpine-oraclejdk8:8.131.11-cleaned

MAINTAINER François Brulotte <francois.brulotte@gmail.com>

# Set TeamCity properties
ENV TEAMCITY_SERVER_MEM_OPTS -Xmx1024m
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

# TeamCity data is stored in a volume to facilitate container upgrade
VOLUME $TEAMCITY_DATA_PATH

# Download and install TeamCity to /opt
ENV TEAMCITY_VERSION 2017.1.2
ENV TEAMCITY_DOWNLOAD https://download.jetbrains.com/teamcity

RUN mkdir /opt && \
    apk add --no-cache --virtual .bootstrap-deps wget ca-certificates && \
    wget -O- $TEAMCITY_DOWNLOAD/TeamCity-$TEAMCITY_VERSION.tar.gz | tar xz -C /opt && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/clearcase.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/mercurial.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/eclipse-plugin-distributor.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/vs-addin-distributor.zip && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/svn && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/tfs && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/vss && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/dot* && \
    apk del .bootstrap-deps

EXPOSE 8111

ENTRYPOINT ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
