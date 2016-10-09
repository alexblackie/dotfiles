# Import git prompt functions for __git_ps1
source /usr/share/git-core/contrib/completion/git-prompt.sh

# Turn on parallel history
shopt -s histappend
history -a

# Automatically update LINES and COLUMNS on terminal resize
shopt -s checkwinsize

# Set a custom fancy prompt
export PS1="(\h) \[\033[34m\]\w\[\033[33m\]\$(__git_ps1 '@%s')\[\033[0m\] > "

# Import shell-agnostic functions and aliases
source $HOME/.commonrc
