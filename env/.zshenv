export PATH=$PATH:~/.local/bin

if [ -n $DISPLAY ]; then
    export XDG_CURRENT_DESKTOP=sway
    export DRI_PRIME=1
    #export QT_WAYLAND_FORCE_DPI=physical
    export GDK_BACKEND=wayland
    export QT_QPA_PLATFORM=wayland-egl
    export CLUTTER_BACKEND=wayland
    export SDL_VIDEODRIVER=wayland
    export BEMENU_BACKEND=wayland
    #export DISPLAY=:0
    #export WAYLAND_DISPLAY=wayland-0
fi

export ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/.tmux.conf
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_UNICODE=true
