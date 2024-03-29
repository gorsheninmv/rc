#!/usr/bin/env bash
# terminal application launcher for sway, using fzf
# original command:
# Based on: https://github.com/swaywm/sway/issues/1367
# bindsym $altkey+space exec termite --name=launcher -e \
#    "bash -c 'compgen -c | sort -u | fzf --no-extended --print-query | \
#    tail -n1 | xargs -r swaymsg -t command exec'"

HIST_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/sway-launcher-history.txt"

# Get shell command list
# This may include the occasional non-executable file
command_list=$({ IFS=:; ls -H $PATH; } | grep -v '/.*' | sort -u)

# read existing command history
if [ -f "$HIST_FILE" ]; then
    command_history=$(cat "$HIST_FILE")
else
    command_history=""
fi

# search command list
command_str=$(printf "%s\n" "${command_history}" "${command_list}" | \
    sed -E 's/^[0-9]+ (.+)$/\1/' | \
    fzf --no-extended --print-query --no-sort | \
    tail -n1) || exit 1

if [ "$command_str" = "" ]; then
    exit 1
fi

# using \E flag from perl regex
test "${command_str#*\\E}" != "$command_str" && echo "command can't contain '\E'"
test "${command_str#*\\E}" != "$command_str" && exit 1

# get full line from history (with count number)
hist_line=$(echo "$command_history" | grep -Pe "^[0-9]+ \Q$command_str\E$")
# echo "Hist Line: $hist_line"

if [ "$hist_line" = "" ]; then
    hist_count=1
else
    # Increment usage count
    hist_count=$(echo "$hist_line" | sed -E 's/^([0-9]+) .+$/\1/')
    hist_count=$((hist_count + 1))
    # delete line, to add updated later
    # echo "Hist Before: $command_history"
    command_history=$(echo "$command_history" | \
        grep --invert-match -Pe "^[0-9]+ \Q$command_str\E$")
    # echo "Hist After: $command_history"
fi

# update history
update_line="${hist_count} ${command_str}"
printf "%s\n" "${update_line}" "${command_history}" | \
    sort --numeric-sort --reverse > "$HIST_FILE"
# echo "$update_line"

# execute command
echo "$command_str"
swaymsg -t command exec "$command_str"
