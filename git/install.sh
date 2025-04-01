#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

if [ ! -d $XDG_CONFIG_HOME ]
    then mkdir -p $XDG_CONFIG_HOME
fi

LINKFULLPATH="$XDG_CONFIG_HOME/git"
FOLDERFULLPATH="$BASEDIR/src"

if [ -d $LINKFULLPATH ]
    then rm -r $LINKFULLPATH
fi

ln -s $FOLDERFULLPATH $LINKFULLPATH

echo "script completed!"
