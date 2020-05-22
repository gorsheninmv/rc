# Aliases
alias off='shutdown -h now'
alias rbt='reboot'
alias c='clear'
alias t='tmux attach || tmux new'
alias cal='cal -m -w -3'
alias mpv='mpv --geometry=40%'

function mnt {
	if [ "$1" ]
		 then udisksctl mount -b $1
	else
		 echo "Device name is not defined"
	fi
}

function unmnt {
	if [ "$1" ]
		 then udisksctl unmount -b $1
	else
		 echo "Device name is not defined"
	fi
}

function add-wsl-aliases {
    alias pro='cd /mnt/c/projects'
}

if grep -q Microsoft /proc/version; then
    add-wsl-aliases
fi
