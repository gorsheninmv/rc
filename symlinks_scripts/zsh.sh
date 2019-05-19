#! /bin/bash

echo "source ~/.bash_aliases" >> ~/.zshrc
echo 'export LANG="en_US.UTF-8"' >> ~/.zshrc
echo 'export LC_ALL="en_US.UTF-8"' >> ~/.zshrc


SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$(dirname "$SCRIPT")")
FILENAME="$BASEDIR/sway-start.sh"

echo "source $FILENAME" >> ~/.zprofile

echo "script competed!"
