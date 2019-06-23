# docker-quake2-server

A containerized [Quake II](https://www.gog.com/game/quake_ii_quad_damage) server.

# Requirements
* Full copy of [Quake II](https://www.gog.com/game/quake_ii_quad_damage).

# Operation

## Build

Because of how Quake II is licensed you will have to build this container prior to deployment. Do so with the following steps, all deployment assumes a locally-built container.

* Install Quake II to an accessible location (for example, `/home/$(whoami)/Quake II`).
* Copy or symlink all contents of that directory to `/data`.
  * `cp -r /home/$(whoami)/Quake\ II/* ./data/`
* Build the container (`docker build . -t $(whoami)/quake2-server:latest`)

## Run

```
docker run -it \
  --rm \
  -p 27910:27910 \
  -p 27910:27910/udp \
  -e GAME='dm' \
  --name=quake2-server \
  $(whoami)/quake2-server:latest
```

# Environment Variables
* `GAME`: set the gametype (default: `dm`)
