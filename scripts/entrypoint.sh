#!/usr/bin/env bash

# Variables
USER=${USER:-'quake2-server'}

# Launch
su - ${USER} -c /usr/local/bin/run_quake2_server.sh $@
