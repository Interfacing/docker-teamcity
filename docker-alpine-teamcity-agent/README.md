# Minimal Docker image with TeamCity agent

[Docker](https://www.docker.com/) image to run [TeamCity](https://www.jetbrains.com/teamcity/) agent application.
This is based off [Alpine](https://registry.hub.docker.com/_/alpine/) to keep the size minimal.

## 1. Build Docker image
```
docker build -t teamcity-agent .
```

## 2. Run Docker
```
docker run --name teamcity-agent-1 -d -p 9090:9090 -e TEAMCITY_SERVER=<teamcity_serverl_url> teamcity-agent
```
Example:
```
docker run --name teamcity-agent-1 -d -p 9090:9090 -e TEAMCITY_SERVER=http://192.168.99.100:8111 teamcity-agent
```
