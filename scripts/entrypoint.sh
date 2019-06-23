#!/usr/bin/env bash

# Variables
USER=${USER:-'quake2-server'}

# Install the game data
/usr/local/bin/install_quake2_data.sh

# Launch
su - ${USER} -c /usr/local/bin/run_quake2_server.sh $@
