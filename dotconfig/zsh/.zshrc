# This only works in .zshrc 
####################################
export PATH=$PATH:$HOME/.local/bin #
####################################
# and nowhere else 

source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/hashdirs.zsh

# For yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Enabling Portage completions and gentoo prompt for zsh
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion:*' menu select
zstyle ':completion::completion:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
export HISTSIZE=2000
export HISTFILE="$ZDOTDIR/.history"
# export SAVEHIST="$HISTFILE"
setopt hist_ignore_all_dups
setopt hist_ignore_space
# Correction
setopt correctall

# Using antigen to load the zsh-syntax highlighting plugin
source $ZDOTDIR/antigen.zsh
antigen use oh-my-zsh

# Use the oh-my-zsh plugins from here
antigen bundle git
antigen bundle command-not-found

# Source the catppuccin zsh-syntax-highlighting before
# loading the zsh-syntax-highlighting plugin
source $ZDOTDIR/catppuccin_mocha-zsh-syntax-highlighting.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Here is the real theme
antigen theme gentoo

antigen apply

# Source modifications in plugins here 
source $ZDOTDIR/plugin_mod.zsh
MANPAGER="sh -c 'col -bx | bat -l man -p'"

# For bat themed help command 
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

