#!/usr/bin/env bash

# Variables
CONFIGDIR="/etc/quake2-server"
SERVERDIR="/usr/share/games/quake2"

# Functions

# Set up all symlinks to config files
link_configs()
{
  # Check all config files
  for i in $(ls ${CONFIGDIR}/*.cfg); do
    # If the file is not symlinked then do so
    if ! [[ -f ${SERVERDIR}/baseq2/$(basename $i) ]]; then
      ln -s $i ${SERVERDIR}/baseq2/$(basename $i)
    fi 
  done
}

link_configs
