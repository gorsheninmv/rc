#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

COMMANDS=("off" "reboot" "out")
BINPATH="$HOME/.local/bin"

for item in ${COMMANDS[@]}
do
    echo "ln -s -f "$BASEDIR/src/$item" "$BINPATH/$item""
    ln -s -f "$BASEDIR/src/$item" "$BINPATH/$item"
done
