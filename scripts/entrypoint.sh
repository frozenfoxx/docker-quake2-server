#!/usr/bin/env bash

# First repackage the Quake 2 game data
/usr/local/bin/install_quake2_data.sh

# Now choose a config
if [ "$GAME" != 'ctf' ] && [ "$GAME" != 'dm64' ] && [ "$GAME" != 'mp1' ] && [ "$GAME" != 'mp2' ]; then
    GAME=dm
fi

# Launch
/usr/games/quake2-server +exec /app/config/server.cfg +exec /app/config/$GAME.cfg $@
