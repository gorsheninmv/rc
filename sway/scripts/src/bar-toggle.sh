#!/bin/bash

function kill_bar() {
    pkill waybar
    pkill sway-layout
}

function exec_bar() {
    waybar
}

function is_bar_running() {
    local PS_RESULT=$(ps -e | grep waybar)
    [ -z "$PS_RESULT" ] && return 0 || return 1
}

is_bar_running
IS_BAR_RUNNING=$?

if [ "$IS_BAR_RUNNING" == '0' ]
then
    exec_bar
else kill_bar
fi
