# Aliases
alias off='shutdown -h now'
alias rbt='reboot'
alias c='clear'

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
