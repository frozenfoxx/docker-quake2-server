#!/usr/bin/env bash

# Variables
CONFIGDIR="/etc/quake2-server"
SERVERDIR="/usr/share/games/quake2"

# Functions

# Set up all symlinks to config files
link_configs()
{
  # Check all config files for baseq2
  for i in $(ls ${CONFIGDIR}/*.cfg); do
    # If the file is not symlinked then do so
    if ! [[ -f ${SERVERDIR}/baseq2/$(basename $i) ]]; then
      ln -s $i ${SERVERDIR}/baseq2/$(basename $i)
    fi 
  done

  # Check all config files for ctf
  if [[ ${SERVERDIR}/ctf ]]; then
    if [[ -f ${SERVERDIR}/ctf/server.cfg ]]; then
      rm ${SERVERDIR}/ctf/server.cfg
    fi

    # Symlink for CTF
    ln -s ${CONFIGDIR}/ctf.cfg ${SERVERDIR}/ctf/server.cfg
  fi
}

link_configs
