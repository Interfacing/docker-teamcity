# Minimal Docker image with TeamCity server

[Docker](https://www.docker.com/) image to run [TeamCity](https://www.jetbrains.com/teamcity/) server application.
This is based off [Alpine](https://registry.hub.docker.com/_/alpine/) to keep the size minimal.

## 1. Build Docker image
```
docker build -t teamcity-server .
```

## 2. Run Docker

### Running TeamCity server standalone
```
docker run --name teamcity-server -d -p 8111:8111 -v <teamcity_volume>:/var/lib/teamcity teamcity-server
```
Example:
```
docker run --name teamcity-server -d -p 8111:8111 -v /volumes/teamcity:/var/lib/teamcity teamcity-server
```


### Running TeamCity server with PostgreSQL
```
docker run --name teamcity-db -d -e POSTGRES_USER=teamcity -e POSTGRES_PASSWORD=supersecure -v <postgres_volume>:/var/lib/postgresql/data postgres
docker run --name teamcity-server --link teamcity-db:teamcity-db -d -p 8111:8111 -v <teamcity_volume>:/var/lib/teamcity teamcity-server
```
Example:
```
docker run --name teamcity-db -d -e POSTGRES_USER=teamcity -e POSTGRES_PASSWORD=supersecure -v /volumes/postgresql/data:/var/lib/postgresql/data postgres
docker run --name teamcity-server --link teamcity-db:teamcity-db -d -p 8111:8111 -v /volumes/teamcity:/var/lib/teamcity teamcity-server
```

When installing TeamCity, use the following information for database setup:

- Database host: `teamcity-db`
- User name: `teamcity`
- Password: `supersecure`
 
Recommended changes to postgresql.conf:
```
shared_buffers = 512MB
checkpoint_segments = 32
checkpoint_completion_target = 0.9
synchronous_commit = off
```
