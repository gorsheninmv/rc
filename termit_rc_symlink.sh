#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")
CONFIG_FOLDER="$HOME/.config/termit"

if ! [ -d  $CONFIG_FOLDER ]
	then mkdir $CONFIG_FOLDER
fi


if [ -f "$CONFIG_FOLDER/rc.lua" ]
	then rm "$CONFIG_FOLDER/rc.lua"
fi
ln -s "$BASEDIR/termit_rc.lua" "$CONFIG_FOLDER/rc.lua"
