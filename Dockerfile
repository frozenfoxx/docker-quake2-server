FROM debian:stable-slim

LABEL maintainer="FrozenFOXX" \
maintainer.email="frozenfoxx@churchoffoxx.net" \
maintainer.website="http://churchoffoxx.net/"

# Install Updates + Quake2 & OpenFFA MOD:
RUN apt update && \
  apt upgrade -y