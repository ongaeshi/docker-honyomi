# Honyomi's Dockerfile

- [DockerHub](https://hub.docker.com/r/ongaeshi/honyomi/)
- [ongaeshi/honyomi](https://github.com/ongaeshi/honyomi)

## Usage

Run honyomi by the container name to `my-honyomi` (Please your favorite name)

```
$ docker run --name my-honyomi -it -p 9295:9295 ongaeshi/honyomi
Thin web server (v1.6.3 codename Protein Powder)
Maximum connections set to 1024
Listening on 0.0.0.0:9295, CTRL+C to stop
# Container stops at the Ctrl-C
```

Run the container in background.

```
$ docker run --name my-honyomi -d -it -p 9295:9295 ongaeshi/honyomi
```

Start, Stop, Remove the Container.

```
$ docker start my-honyomi
$ docker stop my-honyomi
$ docker rm my-honyomi      # Need stop
```

Run shell.

```
$ docker exec -it my-honyomi /bin/bash
```

## Update Honyomi gem

```
$ docker exec my-honyomi gem install honyomi
$ docker restart my-honyomi
```

## Backup

Copy the honyomi database from the container to the host.

We have archived in the host for boot2docker.

```
$ docker exec my-honyomi tar czvf /backup.tar.gz /root/.honyomi
$ docker cp my-honyomi:/backup.tar.gz ~/tmp/
```

Run the `/path/to/honyomi` in the host as the honyomi database. 

Note: Linux only (See [Mount a host directory as a data volume](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume))

```
$ docker run --name my-honyomi -d -it -p 9295:9295 -v /path/to/honyomi:/root/.honyomi/ ongaeshi/honyomi
```
