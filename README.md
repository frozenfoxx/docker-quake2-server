# docker-quake2-server

A containerized [Quake II](https://www.gog.com/game/quake_ii_quad_damage) server.

# Requirements
* Full copy of [Quake II](https://www.gog.com/game/quake_ii_quad_damage).

# Operation

## Build

Because of how Quake II is licensed you will have to build this container prior to deployment. Do so with the following steps, all deployment assumes a locally-built container.

* Install Quake II to an accessible location (for example, `/home/user/Quake II`).

## Run

* Mount Quake II installation to `/data` in the container.
```
docker run -it \
  --rm \
  -p 27910:27910 \
  -p 27910:27910/udp \
  -v /Path/To/Quake II/:/data \
  --name=quake2-server \
  frozenfoxx/quake2-server:latest
```
