#!/bin/bash

if [ -z $XDG_CONFIG_HOME ]
then
  echo "XDG_CONFIG_HOME not set!"
  exit 1
fi

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

if [ ! -d $XDG_CONFIG_HOME ]
    then mkdir -p $XDG_CONFIG_HOME
fi

LINKFULLPATH="$XDG_CONFIG_HOME/wezterm"
FOLDERFULLPATH="$BASEDIR/src"

if [ -d $LINKFULLPATH ]
    then rm -r $LINKFULLPATH
fi

echo "ln -s $FOLDERFULLPATH $LINKFULLPATH"
ln -s $FOLDERFULLPATH $LINKFULLPATH
echo "script completed"
