EXTENSIONS=(
	# Fedora
	/usr/share/git-core/contrib/completion/git-prompt.sh
	/usr/share/doc/git-core-doc/contrib/completion/git-completion.bash

	# RHEL/CentOS
	/usr/share/doc/git-*/contrib/completion/git-completion.bash

	# Ubuntu/Debian
	/etc/bash_completion.d/git-prompt
	/usr/share/bash-completion/completions/git

	# macOS/BSD
	/usr/local/etc/bash_completion.d/git-prompt.sh
	/usr/local/etc/bash_completion.d/git-completion.bash

	# FreeBSD
	/usr/local/share/git-core/contrib/completion/git-prompt.sh
	/usr/local/share/git-core/contrib/completion/git-completion.bash

	# asdf version manager
	$HOME/.asdf/completions/asdf.bash
)

for e in ${EXTENSIONS[*]} ; do
	# Source each extension only if it exists. This allows us to pile up groups
	# of paths for different OS's and only load the ones for the current OS.
	[[ -e "$e" ]] && source "$e"
done

# Turn on parallel history
shopt -s histappend
history -a

# Automatically update LINES and COLUMNS on terminal resize
shopt -s checkwinsize

# Set a custom fancy prompt
# If we're running in a VM, mark it as such.
IS_VM=$([ -e /proc/cpuinfo ] && grep -q hypervisor /proc/cpuinfo && echo "[vm] ")
# If we're running as root, also mark that loudly.
IS_ROOT=$([ "$UID" = "0" ] && echo "[ROOT] ")
export PS1="\[\033[31m\]$IS_ROOT$IS_VM\[\033[34m\]\w\[\033[33m\]\$(__git_ps1 '@%s' 2>/dev/null)\[\033[0m\] → "

# Import shell-agnostic functions and aliases
source $HOME/.commonrc
