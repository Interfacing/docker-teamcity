FROM frolvlad/alpine-oraclejdk8

MAINTAINER François Brulotte <francois.brulotte@gmail.com>

# Set TeamCity properties
ENV TEAMCITY_SERVER_MEM_OPTS -Xmx1024m
ENV TEAMCITY_DATA_PATH /var/lib/teamcity

# TeamCity data is stored in a volume to facilitate container upgrade
VOLUME $TEAMCITY_DATA_PATH

# Download and install TeamCity to /opt
ENV TEAMCITY_VERSION 10.0.1
ENV TEAMCITY_DOWNLOAD http://download.jetbrains.com/teamcity

RUN mkdir /opt && \
    wget -O- $TEAMCITY_DOWNLOAD/TeamCity-$TEAMCITY_VERSION.tar.gz | tar xz -C /opt && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/clearcase.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/mercurial.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/eclipse-plugin-distributor.zip && \
    rm -f  /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/vs-addin-distributor.zip && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/svn && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/tfs && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/vss && \
    rm -rf /opt/TeamCity/webapps/ROOT/WEB-INF/plugins/dot*

EXPOSE 8111

ENTRYPOINT ["/opt/TeamCity/bin/teamcity-server.sh", "run"]
