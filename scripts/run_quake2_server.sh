#!/usr/bin/env bash

# Variables
GAME=${GAME:-''}

## Set game-specific variable defaults
if [ ${GAME} == 'dm' ]; then
  ALLOW_DOWNLOAD=1
elif [ ${GAME} == 'dm64' ]; then
  ALLOW_DOWNLOAD=1
elif [ ${GAME} == 'ctf' ]; then
  ALLOW_DOWNLOAD=1
elif [ ${GAME} == 'mp1' ]; then
  ALLOW_DOWNLOAD=1
elif [ ${GAME} == 'mp2' ]; then
  ALLOW_DOWNLOAD=1
else
  echo "No game type selected, set with GAME!"
  usage
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
/usr/games/quake2-server +exec /app/config/server.cfg +exec /app/config/${GAME}.cfg $@
