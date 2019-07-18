# caddy2-docker
> Unofficial Caddy 2 Docker image (WIP).

### Usage

First, build the image:

```sh
$ docker build . -t caddy2
```

Then create and run the container:

```sh
$ docker run -d -p 2080:2080 --name caddy2ctr caddy2
```

Caddy 2 will be reachable at `localhost:2080`.