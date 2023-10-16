#!/bin/sh

if [ "$POMO_STATE" == "BREAKING" ] ; then
    notify-send 'Time to take a break!'
fi
