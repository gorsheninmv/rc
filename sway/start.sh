#! /bin/bash

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    echo "US" > /tmp/layout
    exec sway
fi
