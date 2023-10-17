#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")


FOLDERNAME="nvim"
LINKNAME="nvim"
LINKPATH="$HOME/.config/$LINKNAME"
FOLDERPATH="$BASEDIR/$FOLDERNAME"

if [ -d "$LINKPATH" ]
	then rm -rf "$LINKPATH"
fi
ln -s "$FOLDERPATH" "$LINKPATH"

echo "script completed!"
