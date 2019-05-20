#! /bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")


FILENAME="change-layout-info.sh"
LINKPATH="$HOME/$FILENAME"
FILEPATH="$BASEDIR/$FILENAME"

if [ -f "$LINKPATH" ]
	then rm "$LINKPATH"
fi
ln -s "$FILEPATH" "$LINKPATH"

echo "script completed!"
