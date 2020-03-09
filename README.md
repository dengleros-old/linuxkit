# linuxkit @ docker container

With docker login / auth

## build os

```
docker run --rm -ti -v /root/.docker/config.json:/root/.docker/config.json -v <PACKAGE_DIR>:<PACKAGE_DIR> --workdir <PACKAGE_DIR> -v /var/run/docker.sock:/var/run/docker.sock linuxkit build -h
```

## run os

```
docker run --rm -ti -v /root/.docker/config.json:/root/.docker/config.json -v <PACKAGE_DIR>:<PACKAGE_DIR> --workdir <PACKAGE_DIR> -v /var/run/docker.sock:/var/run/docker.sock linuxkit run -h
```

## build package

```
docker run --rm -ti -v /root/.docker/config.json:/root/.docker/config.json -v <PACKAGE_DIR>:<PACKAGE_DIR> --workdir <PACKAGE_DIR> -v /var/run/docker.sock:/var/run/docker.sock linuxkit pkg push -network -disable-content-trust .
```

## push package 

```
docker run --rm -ti -v /root/.docker/config.json:/root/.docker/config.json -v <PACKAGE_DIR>:<PACKAGE_DIR> --workdir <PACKAGE_DIR> -v /var/run/docker.sock:/var/run/docker.sock linuxkit pkg push -network -disable-content-trust .
```

