# docker-teamcity

Docker composition to launch TeamCity server using PostgreSQL database and a TeamCity agent.

## Install

after cloning the repository, create a `docker-compose.override.yml` file to override the TeamCity server url with the ip address of the host.

For example:
```
teamcity-agent:
    environment:
        - TEAMCITY_SERVER=http://192.168.0.100:8111
```

## Run

To launch the TeamCity docker application, simply use `docker-compose up -d`
