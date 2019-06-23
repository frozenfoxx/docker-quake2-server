# Base image
FROM ubuntu:18.04

# Information
LABEL maintainer="FrozenFOXX" \
maintainer.email="frozenfoxx@churchoffoxx.net" \
maintainer.website="http://churchoffoxx.net/"

# Variables
ENV HOME=/root \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn \
    DEBIAN_FRONTEND=noninteractive \
    DATADIR='/data' \
    USER='quake2-server'

# Install Updates + Quake2 Server
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      build-essential \
      game-data-packager \
      innoextract \
      libc6-dev \
      quake2-server

# Load up scripts
COPY scripts/* /usr/local/bin/

# Set up config directory
RUN mkdir -p /app/config
COPY ./config/* /app/config/

# Copy over game data
COPY ./data/* /data/

# Install game data packages
RUN /usr/local/bin/install_quake2_data.sh

# Clean up unnecessary packages
RUN apt-get autoremove -y && \
      rm -rf /var/lib/apt/lists/*

# Expose ports
EXPOSE 27910
EXPOSE 27910/udp

# Launch processes
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
