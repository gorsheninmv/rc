#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

CONFIGPATH="$HOME/.config/vifm"

if [ ! -d $CONFIGPATH ]
    then mkdir -p $CONFIGPATH
fi

# Colors
LINKFULLPATH="$CONFIGPATH/colors"
FOLDERFULLPATH="$BASEDIR/colors"

if [ -d $LINKFULLPATH ]
    then rm -r $LINKFULLPATH
fi

ln -s $FOLDERFULLPATH $LINKFULLPATH

echo "script completed"

    

