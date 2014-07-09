# ------------------------------------------------------------------------------
# Oh My ZSH Settings
# ------------------------------------------------------------------------------
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kolo"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)


# ------------------------------------------------------------------------------
# Start Oh My ZSH
# ------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh


# ------------------------------------------------------------------------------
# Custom overrides
# ------------------------------------------------------------------------------
setopt nocorrectall; setopt correct # Don't offer corrections for arguments, just commands

[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
