#!/usr/bin/env bash
# firefox.sh - launch Firefox with AMD hardware acceleration
# See https://wiki.archlinux.org/index.php/Firefox#Hardware_video_acceleration

main() {
	## Export $vanvaapi if available
	# Only export $vanvaapi if on Arch Linux, because pacman is used
	# $OS variable is available from dotfiles/general/.bash_profile
	[[ "$OS" == 'Arch' ]] \
	&& [[ -n "$(lsmod | grep amdpgu)" ]]\
	&& vanamd='igen'\
	&& pacman -Qi 'libva-mesa-driver' 'mesapau' > '/dev/null'\
	&& vanvaapi='igen'
	
	case "$vanvaapi" in
	# For system with libva-api video hardware acceleration
		'igen')
			# Uncomment the line below to have firefox.sh report $vanvaapi to sdtout
			#printf "firefox.sh: vanvaapi=%s\nvanamd=%s" "$vanvaapi" "$vanamd"
			case "$vanamd" in
				'igen')
					# WebRenderer requires gfx.webrender.all=1 in Firefox://about:config
					MOZ_WEBRENDER=1 MOZ_X11_EGL=1 firefox "$1"
			esac ;;
		*)
			[[ -z $vanvaapi ]] && firefox "$1" ;;
	esac
}

main $1
