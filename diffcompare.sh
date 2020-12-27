#!/usr/bin/env bash

# Set variables
mydirs=("$HOME/git/shs/unix-eine" "$HOME/git/unix");
differf="$(diff -rq ${mydirs[0]} ${mydirs[1]} | grep 'differ'| awk '{print $2}')";

# Remove 'awk' portion above to get unfiltered output
printf "%s\n" "$differf"

case "$1" in
	# Sync differing files
	'f'|'fix'|'s'|'sync')
		# Source yn.sh from user's home to provide readprompt()
		. $HOME/bin/yn.sh
		
		# Prompt user for target files
		printf "\n\n\nEnter relative path from the following directories\n"
		printf "%s\n" "${mydirs[@]}";
		readprompt "Relative path: "
		
		if [[ -n "$answer" ]]; then
			if [[ "$answer" == *"/"* ]]; then
				# If $answer contains forward slash, prepend $answer to target
				rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/$answer"
			else
				# If $answer does not have forward slash,
				# i.e. it is top-level file or directory, use dot '.'
				rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/."
			fi
		fi ;;
esac
