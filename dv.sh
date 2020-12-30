#!/usr/bin/env bash
# dv - stupid diff viewer using 'diff -rq'
# useful for tracking different text files without using git branches
# dv can be put in shell $PATH, as it uses absolute paths to files
# I plan to next add associative arrays for reverse install.sh functionality
# To use dv, first edit mydirs[] values in main() to match your directories
[[ $1 == *"h"* ]] && sed -n '2p;6p' < "$0" && exit 0
main() {
	# Our directories will be stored in an array of 2 ${mydirs[]}.
	# You should audit dv before deciding which item is which array items
	mydirs[0]="$HOME/git/shs/unix-eine"
	mydirs[1]="$HOME/git/unix"
	
	# For unfiltered 'diff -rq' output, remove the portion containing 'awk' and 'sed' below
	# 'awk' is used to filter all but the 2nd field of the output, which is the files in ${mydir[0]}
	# 'sed' is then used to extract the relative path of the file to ${mydir[0]}
	differf="$(diff -rq ${mydirs[0]} ${mydirs[1]} | grep 'differ'| awk '{print $2}' | sed "s,${mydirs[0]},,g")";
	
	# Print output to screen
	printf "%s\n" "$differf"
	printf "\n%s compared to %s\n" "${mydirs[0]}" "${mydirs[1]}"
}

# If argument $1 is specified, then dv.sh will use rsync to copy from ${mydirs[0]} to ${mydirs[1]}
rsyncf() {
	case "$1" in
		# Sync differing files
		'f'|'fix'|'s'|'sync')
			
			# Source yn.sh from user's home to provide readprompt()
			# dv.sh should already be distributed with sh-tools/bin/yn.sh
			. $HOME/bin/yn.sh
	
			# Prompt user for target files - user input will be returned by as $answer by readprompt()
			# main() displayed filtered output, so it's safe if the user enters relative path as displayed
			printf "\nCopy from %s to %s\n" "${mydirs[1]}" "${mydirs[0]}"
			readprompt "Select file or directory name from above output"
	
			if [[ -n "$answer" ]]; then
			# We will try to sync ${mydirs[*]} here
				if [[ "$answer" == *"/"* ]]; then
					# If $answer contains forward slash, append $answer to target
					rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/$answer"
				else
					# If $answer does not have forward slash,
					# i.e. it is top-level file or directory, use dot '.'
					rsync -rva "${mydirs[1]}/$answer" "${mydirs[0]}/."
				fi
			fi ;;
	esac
}

declare -a mydirs

main "$1" &&\
[[ -n "$1" ]] && rsyncf "$1"
