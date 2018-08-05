#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")


FILENAME=".gitconfig"
LINKPATH="$HOME/$FILENAME"
FILEPATH="$BASEDIR/$FILENAME"

if [ -f "$FULLPATH" ]
	then rm "$FULLPATH"
fi
ln -s "$FILEPATH" "$LINKPATH"

echo "script completed!"
