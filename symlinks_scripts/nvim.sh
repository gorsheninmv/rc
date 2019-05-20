#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")


FILENAME=".vimrc"
LINKNAME="init.vim"
LINKPATH="$HOME/.config/nvim/$LINKNAME"
FILEPATH="$BASEDIR/$FILENAME"

if [ -f "$LINKPATH" ]
	then rm "$LINKPATH"
fi
ln -s "$FILEPATH" "$LINKPATH"

echo "script completed!"

