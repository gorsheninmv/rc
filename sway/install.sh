#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

# Install scripts for Sway
"$BASEDIR/scripts/install.sh"
echo "scripts for Sway installed"

# Set Waybar configuration
"$BASEDIR/waybar/install.sh"
echo "Waybar configuration installed"

# Install system control scripts
"$BASEDIR/control/install.sh"
echo "system control installed"


# Configuration
CONFIGPATH="$HOME/.config/sway"

if [ ! -d "$CONFIGPATH" ]
    then mkdir -p $CONFIGPATH
fi

LINKFULLPATH="$CONFIGPATH/config"
FILEFULLPATH="$BASEDIR/src/config"

ln -s -f $FILEFULLPATH $LINKFULLPATH 


# Start script
BINPATH="$HOME/.local/bin/sway"
LINKFULLPATH="$BINPATH/start.sh"
FILEFULLPATH="$BASEDIR/src/start.sh"

ln -s -f $FILEFULLPATH $LINKFULLPATH

echo "script completed!"
