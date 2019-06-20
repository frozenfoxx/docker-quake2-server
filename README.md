# docker-quake2-server

A containerized Quake II server.

# Requirements
* Full copy of Quake II

# Operation
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
