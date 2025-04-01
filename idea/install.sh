#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")


LINKPATH="$HOME/_ideavimrc"
FILEPATH="$BASEDIR/src/_ideavimrc"

if [ -f "$LINKPATH" ]
	then rm -f "$LINKPATH"
fi
ln -s "$FILEPATH" "$LINKPATH"

echo "script completed!"
