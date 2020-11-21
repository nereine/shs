# Load the shell dotfiles, and then some:
# Note: $PATH configuration is provided in $HOME/.config/shell/paths

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return
# fts - files to source
fts=(\
	"$HOME/.config/shell/paths"\
	"$HOME/.config/shell/prompts"\
	"$HOME/.config/shell/aliases"\
	)
# Source $fts files with 'for' loop	
for f in ${fts[@]};
	do [[ -r "$f" ]] && [[ -f "$f" ]] &&\
	. "$f";
done
# No persistent shell history
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
unset HISTFILE
# Window size
shopt -s checkwinsize

# Get kernel info
kern="$(uname)"
case "$kern" in
# Get OS info
	'Darwin')	export OS="$kern" ;;
	'OpenBSD')	export OS="$kern" ;;
	'FreeBSD')	export OS="$kern" ;;
	'Linux')	[[ -n "$(command -v apt-get )" ]] && export OS="Debian"
			[[ -n "$(command -v pacman )" ]] && export OS="Arch"
			[[ -n "$(command -v xbps)" ]] && export OS="Void"
			[[ -n "$(command -v dns)" ]] && export OS="Redhat" ;;
esac
# Set some OS specific shell configuration
case "$OS" in
	"Darwin")
		# bash_completion stuff
		if [[ -n "$(command -v "brew")" ]] && [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]]; then
			export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"\
			. "$(brew --prefix)/etc/profile.d/bash_completion.sh" 
		else
			printf ".bash_profile: Homebrew bash completion may be broken.\n"
		fi
		# Add `killall` tab completion for common apps
		complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" kilall	;;
esac
