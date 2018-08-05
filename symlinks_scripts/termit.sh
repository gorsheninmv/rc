#!/bin/bash

SCRIPT=$(realpath -e "$0")
RC_PATH=$(dirname "$(dirname "$SCRIPT")")
RC_TERMIT_PATH="$RC_PATH/termit"
CONFIG_FOLDER="$HOME/.config"
TERMIT_FOLDER="$CONFIG_FOLDER/termit"

if ! [ -d "$CONFIG_FOLDER" ]
	then mkdir "$CONFIG_FOLDER"
fi

if [ -d  $TERMIT_FOLDER ]
	then rm "$TERMIT_FOLDER"
fi

ln -s "$RC_TERMIT_PATH" "$TERMIT_FOLDER"

echo "script compelted!"
