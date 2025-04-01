#!/bin/bash

SCRIPT=$(realpath -e "$0")
RC_DIR=$(dirname "$(dirname "$SCRIPT")")

MPD_NCMPCPP_RC_DIR="$RC_DIR/mpd-ncmpcpp"

MPD_FILENAME="mpd.conf"
MPD_RC_CONF_PATH="$MPD_NCMPCPP_RC_DIR/$MPD_FILENAME"

NCMPCPP_FILENAME='config'
NCMPCPP_RC_CONF_PATH="$MPD_NCMPCPP_RC_DIR/$NCMPCPP_FILENAME"

MPD_LINK_DIR="$HOME/.mpd"
MPD_LINK_PATH="$MPD_LINK_DIR/$MPD_FILENAME"

NCMPCPP_LINK_DIR="$HOME/.ncmpcpp"
NCMPCPP_LINK_PATH="$NCMPCPP_LINK_DIR/$NCMPCPP_FILENAME"

if [ ! -d "$MPD_LINK_DIR" ]
then 
    mkdir "$MPD_LINK_DIR"
fi

if [ -f "$MPD_LINK_PATH" ]
	then rm "$MPD_LINK_PATH"
fi

ln -s "$MPD_RC_CONF_PATH" "$MPD_LINK_PATH"

if [ ! -d "$NCMPCPP_LINK_DIR" ]
then 
    mkdir "$NCMPCPP_LINK_DIR"
fi

if [ -f "$NCMPCPP_LINK_PATH" ]
	then rm "$NCMPCPP_LINK_PATH"
fi

ln -s "$NCMPCPP_RC_CONF_PATH" "$NCMPCPP_LINK_PATH"

echo "script completed!"



