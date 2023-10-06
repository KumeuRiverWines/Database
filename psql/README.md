# PSQL docker container

Prerequisites:
Pulling PSQL with TimeScale DB extension docker image
```
$ docker pull timescale/timescaledb
```
How to build container
```
$ docker build -t <image-name> .
```

How to run conatiner
```
$ docker run --name <container-name> --env-file .env -d <image-name>
```



Accessing the Running Container
Accessing container shell
```
$ docker exec -it <container-name> sh
```
Accessing psql within container
```
$ psql -U postgres -h localhost -d kumeudb
```



