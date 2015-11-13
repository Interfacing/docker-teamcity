# Docker image with TeamCity agent and Docker support

[Docker](https://www.docker.com/) image to run [TeamCity](https://www.jetbrains.com/teamcity/) agent application.
This is based off Debian in order to be able to use docker in the container to access host machine.

## 1. Build Docker image
```
docker build -t teamcity-agent-docker .
```

## 2. Run Docker
```
docker run --name teamcity-agent-docker -d -p 9091:9090 -e TEAMCITY_SERVER=<teamcity_serverl_url> teamcity-agent-docker
```
Example:
```
docker run --name teamcity-agent-docker -d -p 9091:9090 -e TEAMCITY_SERVER=http://192.168.99.100:8111 teamcity-agent-docker
```
