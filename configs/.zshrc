# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------
ZSH="$HOME/.zsh"

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt hist_verify

source "$ZSH/history-substring-search.zsh"
autoload -U history-substring-search-up
zle -N history-substring-search-up


# ------------------------------------------------------------------------------
# Configure fancier autocompletion
# ------------------------------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete _ignored _approximate
setopt nocorrect # disable correction for arguments
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/


# ------------------------------------------------------------------------------
# Disable warnings about rm-ing wildcards
# ------------------------------------------------------------------------------
setopt rm_star_silent

# ------------------------------------------------------------------------------
# Set custom prompt
# ------------------------------------------------------------------------------

autoload colors && colors
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '@%b'

precmd () {
	psvar=()

	vcs_info
	[[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%{$fg[blue]%}%~%{$reset_color%}%{$fg[cyan]%}%1v%{$reset_color%} › "

# ------------------------------------------------------------------------------
# Key Bindings
# ------------------------------------------------------------------------------

# enable Emacs bindings
bindkey -e

# Fuzzy history search: type a command + up arrow
# (cover basically every different keycode)
bindkey "\e[A" history-substring-search-up
bindkey "^[[A" history-substring-search-up
bindkey "^[OA" history-substring-search-up

# Make forward delete work
bindkey "\e[3~" delete-char

zle_fzyfindlocal() { fzyfindlocal ; zle reset-prompt }
zle -N zle_fzyfindlocal
unsetopt flowcontrol # Required to rebind ^S
bindkey "^S" "zle_fzyfindlocal"

# Edit the current command in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# ------------------------------------------------------------------------------
# Source common shell config
# ------------------------------------------------------------------------------

source "$HOME/.commonrc"
