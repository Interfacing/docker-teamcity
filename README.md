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

## Configure TeamCity
### PostgreSQL JDBC driver

Start a docker and attach volumes of teamcity-server docker:
```
docker run -it --rm --volumes-from <teamcity-server_1> alpine sh
```

Within the docker, download latest PostgreSQL JDBC driver:
```
apk --update add openssl
wget https://jdbc.postgresql.org/download/postgresql-9.4-1205.jdbc41.jar
```
