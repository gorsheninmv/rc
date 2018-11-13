# set tabstop=2

# PATH variable
#PATH=/sbin:$PATH
#export PATH

# EDITOR variable
EDITOR=vim
export EDITOR

# TouchpadSettings
#synclient TapButton1=1

# Monitor settings
# Настраивается в rc.lua
#xrandr --output HDMI1 --auto
#xrandr --output HDMI1 --right-of eDP1

#export PATH="$HOME/.cargo/bin:$PATH"
source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PS1="\[\033[32;1m\][\u@\h \W]\[\033[32;5m\]\$ \[\033[m\]"
export PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig"
