# Import git prompt functions for __git_ps1
[[ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]] && source /usr/share/git-core/contrib/completion/git-prompt.sh
[[ -e /usr/local/etc/bash_completion.d/git-prompt.sh ]] && source /usr/local/etc/bash_completion.d/git-prompt.sh

# Import git completion for args (eg., branch names!)
# On Fedora, this is under `git-core-doc` which seems super wrong...
[[ -e /usr/share/doc/git-core-doc/contrib/completion/git-completion.bash ]] && source /usr/share/doc/git-core-doc/contrib/completion/git-completion.bash
[[ -e /usr/local/etc/bash_completion.d/git-completion.bash ]] && source /usr/local/etc/bash_completion.d/git-completion.bash

# Tell git to also complete for my `g` alias
$(declare -f __git_complete 2>&1 >/dev/null) && __git_complete g __git_main

# Turn on parallel history
shopt -s histappend
history -a

# Automatically update LINES and COLUMNS on terminal resize
shopt -s checkwinsize

# Set a custom fancy prompt
export PS1="(\h) \[\033[34m\]\w\[\033[33m\]\$(__git_ps1 '@%s')\[\033[0m\] > "

# Import shell-agnostic functions and aliases
source $HOME/.commonrc
