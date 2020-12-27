#!/usr/bin/env bash
# yn.sh - stupid yes no prompt
unset answer

notyn() {
	printf "Please enter Y or N for yes or no\n"
	unset yesno
}
simyn() { # yn.sh will return 0 if yes, 1 if no
	while true ; do
		read -r -p "$1 (y/N): " answer
		case "$answer" in 
			[Yy]*)	return 0 && break ;;
			[Nn]*)	return 1 && break ;;	
			*) notyn ;;
		esac
	done
}
simyn-nonbash() { # for non-bash shell
	while true ; do
		printf "$1 (y/N)"
		read "$1 (y/N): " answer
		case "$answer" in 
			Y|y)	return 0 && break ;;
			N|n)	return 1 && break ;;	
			*) notyn ;;
		esac
	done
}
readprompt() {
	printf "%s: " "$1"
	read answer
}
