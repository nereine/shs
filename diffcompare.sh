#!/usr/bin/env bash

mydirs=("$HOME/git/shs/unix-eine" "$HOME/git/unix");

differf="$(diff -rq ${mydirs[0]} ${mydirs[1]} | grep 'differ')";
printf "%s\n" "$differf"

case "$1" in
	'f'|'fix'|'s'|'sync')
		. $HOME/bin/yn.sh
		printf "\n\n\nEnter relative path from the following directories\n"
		printf "%s\n" "${mydirs[@]}";
		readprompt "Relative path: "
		if [[ -n "$answer" ]]; then
			if [[ "$answer" == *"/"* ]]; then
				printf "%s: kuytest"
				rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/$answer"
			else
				rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/."
			fi
		fi ;;
esac
