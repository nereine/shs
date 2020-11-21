#!/bin/bash
function line() {
	[[ -x sh-tools/bin/lb.sh ]] && ./sh-tools/bin/lb.sh
}
function sanity() {
	mkdir -p "$1" ; [[ ! -w "$1" ]] && printf "Could not write to $1" && exit 1
}
function movef() {
	[[ -z "$vanrsync" ]] && [[ -z "$(command -v rsync)" ]] && cp -r "$1" "$2" && printf "rsync not found on your system, files may be installed to incorrect destination, i.e. in a subdirectory.\n" && howcopy="install.sh: used cp" || export vanrsync="igen" && rsync -ra "$1" "$2" && howcopy="install.sh: used rsync" ; printf "%s\n" "$howcopy to install $3 files to $2"
}
installsh() {
	printf "install.sh: sh-tools install destination\n" && read -r -p "(BLANK=default=$HOME/bin): " DEST && [[ -z "$DEST" ]] && DEST="$HOME" &&
	sanity "$DEST"
	movef "$(pwd)/sh-tools/bin" "$DEST" "sh-tools files"
}
installdf() {
	printf "%s\n" "install.sh: installing shell config files" && [[ -z "$sconf" ]] && sconf="$HOME/.config/shell" # shell config directory (for aliases, path, and bash_prompt) Note: sconf is declared in dotfiles/general/.config/shell/aliases
	sanity "$sconf"
	movef "$(pwd)/dotfiles/general/.config/shell" "$sconf" "shell config files"
	line
	printf "%s\n" "install.sh: installing dotfiles" && sanity "$HOME/.vim/colors"
	for dotf in dotfiles/general/{.bashrc,.bash_profile,.vim,.vimrc,.tmux.conf,.Xresources,.config}; do movef "$dotf" "$HOME/" "$dotf" ; done # sync general dotfiles to $HOME
}
# main
printf "install.sh: Enter 'd' for dotfiles, or 's' for sh-tools,\nor press Ctrl+C to exit\n" && read -r -p "(BLANK=default=BOTH): " installprompt && [[ -z $installprompt ]] && installsh && line && installdf || case $installprompt in "s"*) installsh ;; "d"*) installdf ;; esac && unset $vanrsync
