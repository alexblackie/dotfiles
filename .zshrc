# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git alexedits)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/alex/.rbenv/shims:/Users/alex/.rbenv/bin:/Users/alex/.nvm/v0.10.12/bin:/usr/local/bin:/usr/local/sbin:/Users/alex/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH

# Aliases
# ----------------------------------------

alias ls="ls -Gp"
alias la="ls -a"
alias ll="ls -lh"

alias be="bundle exec"
alias g="git"
alias rake="bundle exec rake"

alias ann='bundle exec annotate --position='\''before'\'' --exclude tests,fixtures --show-indexes'
alias prepare='bundle exec rake db:test:prepare'
alias migrate='rake db:migrate && ann && prepare'
alias bems='bundle exec middleman server'
alias fr='foreman run'

alias fucking='sudo'
alias :wq='exit'
alias :q='exit'
alias s.='subl .'

# Libraries/Imports
# ----------------------------------------
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh

export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

if [ -f ~/.env ]; then
  source ~/.env
fi

PATH="/usr/local/heroku/bin:~/bin/:$PATH"

export EDITOR="vim"

# ZSH Customizations
# ----------------------------------------

setopt nocorrectall; setopt correct # Don't offer corrections for arguments, just commands
