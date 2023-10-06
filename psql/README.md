# PSQL docker container

Prerequisites:
Pulling PSQL with TimeScale DB extension docker image
```
$ docker pull timescale/timescaledb
```
How to build container
```
$ docker build -t <image-name>
```

How to run conatiner
```
$ docker run --name <container-name> -e POSTGRES_PASSWORD=password -d <image-name>
```


