#!/bin/bash

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")

EX_FILENAME="bash_ex.sh"
EX_FILEPATH="$BASEDIR/$EX_FILENAME"


BASH_PROFILE_PATH="$HOME/.bash_profile"

if [ -f "$BASH_PROFILE_PATH" ]
    then echo "file '$BASH_PROFILE_PATH' exists"
    else touch "$BASH_PROFILE_PATH"
fi

echo "#source to ex" >> $BASH_PROFILE_PATH
echo "source '$EX_FILEPATH'" >> $BASH_PROFILE_PATH

echo "script completed!"
