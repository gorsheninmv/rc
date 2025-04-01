#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

CONFIGPATH="$HOME/.config"

if [ ! -d $CONFIGPATH ]
    then mkdir -p $CONFIGPATH
fi

LINKFULLPATH="$CONFIGPATH/waybar"
FOLDERFULLPATH="$BASEDIR/src"

if [ -d $LINKFULLPATH ]
    then rm -r $LINKFULLPATH
fi

echo "ln -s $FOLDERFULLPATH $LINKFULLPATH"
ln -s $FOLDERFULLPATH $LINKFULLPATH
