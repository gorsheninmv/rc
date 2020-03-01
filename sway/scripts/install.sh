#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

BINPATH="$HOME/.local/bin/sway"

if [ ! -d $BINPATH ]
    then mkdir -p $BINPATH
fi

LINKFULLPATH="$BINPATH/scripts"
FOLDERFULLPATH="$BASEDIR/src"

if [ -d $LINKFULLPATH ]
    then rm -r $LINKFULLPATH
fi

echo "ln -s $FOLDERFULLPATH $LINKFULLPATH"
ln -s $FOLDERFULLPATH $LINKFULLPATH
