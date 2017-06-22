#!/usr/bin/env sh

if [ ! -d "bin" ]; then
    echo "Setting up TeamCity agent for the first time in $(pwd) with Teamcity Server $TEAMCITY_SERVER"
    wget $TEAMCITY_SERVER/update/buildAgent.zip
    unzip -q buildAgent.zip
    rm buildAgent.zip

    cp conf/buildAgent.dist.properties conf/buildAgent.properties
    sed -i "s/serverUrl=.*/serverUrl=$(echo $TEAMCITY_SERVER | sed -e 's/[\/&]/\\&/g')/" conf/buildAgent.properties
    chmod +x bin/agent.sh
else
    echo "Using agent at $(pwd)"
fi

bin/agent.sh run
