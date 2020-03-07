#!/bin/bash

SCREENSHOTFULLPATH="$HOME/screenshot.png"

if [ "$1" = "win" ]
then 
    JQARG='.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'
    grim -g "$(swaymsg -t get_tree | jq -r "$JQARG" | slurp)" $SCREENSHOTFULLPATH
else
    JQARG='.[] | select(.focused) | .name'
    grim -o $(swaymsg -t get_outputs | jq -r "$JQARG") $SCREENSHOTFULLPATH 
fi


