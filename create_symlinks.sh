#!/bin/bash

# Переписать на lua, используя поиск всех файлов в папке, и для каждого файла уже вызывать этот скрипт

SCRIPT=$(realpath -e "$0")
BASEDIR=$(dirname "$SCRIPT")

if [ -f "$HOME/.bash_aliases" ]
	then rm "$HOME/.bash_aliases"
fi
ln -s "$BASEDIR/.bash_aliases" "$HOME/.bash_aliases"


if [ -f "$HOME/.bash_profile" ]
	then rm "$HOME/.bash_profile"
fi
ln -s "$BASEDIR/.bash_profile" "$HOME/.bash_profile"


if [ -f "$HOME/.bashrc" ]
	then rm "$HOME/.bashrc"
fi
ln -s "$BASEDIR/.bashrc" "$HOME/.bashrc"


if [ -f "$HOME/.gitconfig" ]
	then rm "$HOME/.gitconfig"
fi
ln -s "$BASEDIR/.gitconfig" "$HOME/.gitconfig"


if [ -f "$HOME/.vimrc" ]
	then rm "$HOME/.vimrc"
fi
ln -s "$BASEDIR/.vimrc" "$HOME/.vimrc"
