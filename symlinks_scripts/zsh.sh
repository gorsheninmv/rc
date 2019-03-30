#! /bin/bash

echo "source ~/.bash_aliases" >> ~/.zshrc


SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")
FILENAME="$BASEDIR/sway-start.sh"

echo "source $FILENAME" >> ~/.zprofile

echo "script competed!"
