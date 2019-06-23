#!/usr/bin/env bash

# Variables
## Game Variables
GAME=${GAME:-''}

## Daemon Variables
CHUID='quake2-server'
EXEC='/usr/lib/quake2/quake2-engine-server'
PIDFILE='/var/run/quake2-server.pid'
STARTAS='/usr/games/quake2-server'

## Set game-specific variable defaults
if [[ -z ${GAME} ]]; then
  echo "No game type selected, set with GAME!"
  exit 1
fi

# Functions

# Display usage information
usage()
{
  echo "Usage: [Environment Variables] run_quake2_server.sh"
  echo "  Environment Variables:"
  echo "  GAME                   game type"
}

# Launch
start-stop-daemon --start --pidfile ${PIDFILE} --exec ${EXEC} --startas ${STARTAS} --make-pidfile --chuid ${CHUID} -- +set dedicated 1 +set game ${GAME} +exec server.cfg +exec ${GAME}.cfg $@
