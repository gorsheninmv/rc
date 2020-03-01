#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

COMMANDS=("off" "reboot" "out")
BINPATH="$HOME/.local/bin"

for item in ${COMMANDS[@]}
do
    ln -sf $BASEDIR/$item $BINPATH/$item
done

echo "script completed!"
