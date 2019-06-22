#!/usr/bin/env bash

# First repackage the Quake 2 game data
/usr/local/bin/install_quake2_data.sh

# Launch
/usr/local/bin/run_quake2_server.sh $@
