# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

ZSH=$HOME/.zsh


# ------------------------------------------------------------------------------
# Plugins
# ------------------------------------------------------------------------------
source $ZSH/plugins/history-substring-search.zsh


# ------------------------------------------------------------------------------
# ZSH options
# ------------------------------------------------------------------------------
# Modules
autoload colors && colors
autoload -Uz vcs_info

autoload -U history-substring-search-up
zle -N history-substring-search-up

zmodload zsh/terminfo

# Tab-completion
autoload -Uz compinit && compinit
zstyle ':completion:*' completer _expand _complete _ignored _approximate

# Autocorrection
setopt nocorrectall # disable for arguments
setopt correct

# Autocomplete
unsetopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/

# History
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
setopt share_history # share history between shells


# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '@%b'

precmd () {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%{$fg_bold[green]%}(%m)%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%}%{$fg[yellow]%}%1v%{$reset_color%} %% "


# ------------------------------------------------------------------------------
# Keybindings
# ------------------------------------------------------------------------------
bindkey -e # enable Emacs bindings

# ^R for reverse history search
bindkey '^r' history-incremental-search-backward

# Fuzzy history search: type a command + up arrow
# (cover basically every different keycode)
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "\e[A" history-substring-search-up
bindkey "^[[A" history-substring-search-up
bindkey "^[0A" history-substring-search-up

# Enable HOME key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi

# Enable END key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line
fi

bindkey '^?' backward-delete-char # Enable Backspace (WTF ZSH)
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char # Enable forward-delete
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi


# ------------------------------------------------------------------------------
# Common shell config
# ------------------------------------------------------------------------------
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"
