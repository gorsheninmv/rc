#! /bin/bash

LAYOUT_INFO_FILE="/tmp/layout"
CURRENT_LAYOUT=""

if [ -f $LAYOUT_INFO ]
then
    CURRENT_LAYOUT=$(cat $LAYOUT_INFO_FILE)
fi

if [ "$CURRENT_LAYOUT" == "US" ]
then
    echo "RU" > $LAYOUT_INFO_FILE
fi


if [ "$CURRENT_LAYOUT" == "RU" ]
then
    echo "US" > $LAYOUT_INFO_FILE
fi
