#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

LINKFULLPATH="$HOME/.zshenv"
FILEFULLPATH="$BASEDIR/.zshenv"

ln -s -f $FILEFULLPATH $LINKFULLPATH 

echo "script completed"
