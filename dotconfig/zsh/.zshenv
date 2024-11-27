export XDG_CURRENT_DESKTOP=sway
export KITTY_ENABLE_WAYLAND=1
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh
export EDITOR=nvim
export LESS='-R --use-color -Dd+r$Du+b$'
export SUDO_PROMPT="$(tput setaf 1 bold)[sudo]$(tput sgr0) $(tput setaf 3)password for$(tput sgr0) $(tput setaf 5)%p$(tput sgr0): "

export XDG_PICTURES_DIR=$HOME/Pictures

