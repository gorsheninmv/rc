if [[ $(uname) == "Darwin" ]]; then
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_DATA_HOME=$HOME/.local/share
else
  export TERM=xterm-256color
fi

export ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/.tmux.conf
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_UNICODE=true
export PASSWORD_STORE_DIR=$HOME/Dropbox/pwd
export EDITOR=nvim
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
export NNN_FIFO='/tmp/nnn.fifo'
