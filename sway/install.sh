#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")


# Configuration
CONFIGPATH="$HOME/.config/sway"

if [ ! -d "$CONFIGPATH" ]
    then mkdir -p $CONFIGPATH
fi

LINKFULLPATH="$CONFIGPATH/config"
FILEFULLPATH="$BASEDIR/config"

if [ -e $LINKFULLPATH ]
    then rm $LINKFULLPATH
fi

ln -s $FILEFULLPATH $LINKFULLPATH 


# Bin
BINPATH="$HOME/.local/bin/sway"

if [ ! -d $BINPATH ]
    then mkdir -p $BINPATH
fi

LINKFULLPATH="$BINPATH/scripts"
FOLDERFULLPATH="$BASEDIR/scripts"

if [ -d $LINKFULLPATH ]
    then rm -rf $LINKFULLPATH
fi

ln -s $FOLDERFULLPATH $LINKFULLPATH

LINKFULLPATH="$BINPATH/start.sh"
FILEFULLPATH="$BASEDIR/start.sh"

ln -s $FILEFULLPATH $LINKFULLPATH


echo "script completed"