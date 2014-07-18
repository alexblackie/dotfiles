# ------------------------------------------------------------------------------
# Oh My ZSH Settings
# ------------------------------------------------------------------------------
ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)


# ------------------------------------------------------------------------------
# Start Oh My ZSH
# ------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh


# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' formats \
    '[%b]'

precmd () {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%{$fg_bold[green]%}(%m)%{$reset_color%} %{$fg[blue]%}%1d%{$reset_color%}%{$fg[yellow]%}%1v%{$reset_color%} %% "


# ------------------------------------------------------------------------------
# Custom overrides
# ------------------------------------------------------------------------------
setopt nocorrectall; setopt correct # Don't offer corrections for arguments, just commands

[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
