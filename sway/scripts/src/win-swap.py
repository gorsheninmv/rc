#!/usr/bin/python

'''
DESCRIPTION:
     This script is used in swaywm and swaps two containers.

USAGE EXAMPLE:
    Put 'bindsym $mod+g exec $scripts/win-swap.py' in the config file.
    Get some container focused and press $mod+g. Get another container focused
    and press $mod+g again. The two windows are going to be swapped.

 DEPENDENCIES:
    i3ipc-python

 AUTHOR:
    Misha Gorshenin, gorshenin.mv@gmail.com

LICENSE:
    MIT
'''

import i3ipc

ipc = i3ipc.Connection()
tree = ipc.get_tree()

MARK = 'swapped'

marked = None
focused = tree.find_focused()
swapped = ipc.get_tree().find_marked(MARK)

if (len(swapped) > 0):
    marked = swapped[0]

if marked is None:
    focused.command(f'mark --toggle {MARK}')
else:
    con_id = marked.id
    marked.command(f'mark --toggle {MARK}')
    ipc.command(f'swap container with con_id {con_id}')
