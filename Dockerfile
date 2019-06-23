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
    DATADIR='/data'

# Install Updates + Quake2 Server
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      build-essential \
      game-data-packager \
      innoextract \
      libc6-dev \
      quake2-server

# Set up config directory
RUN mkdir -p /app/config
COPY ./config/* /app/config/

# Load up scripts
COPY scripts/* /usr/local/bin/

# Build and install game data
RUN /usr/local/bin/install_quake2_data.sh

# Clean up unnecessary packages
RUN apt-get autoremove -y && \
      rm -rf /var/lib/apt/lists/*

# Add user
RUN useradd -m -s /bin/bash quake2
USER quake2

# Expose ports
EXPOSE 27910
EXPOSE 27910/udp

# Launch processes
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
