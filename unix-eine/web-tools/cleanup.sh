#!/bin/bash

## This script sources external files (lb.sh, yn.sh, sendweb.sh, and cleanup.sh), which are provided in my "sh-tools/web-tools" from gitlab.com/artnoi-staple/unix.

[[ "$fts_status" != "ok" ]] && source "source.sh"

## Delete files matching the keywords "kw"
cleanupsh() {
	# Get lookup path
	read -r -p "Relative path to search (DEFAULT=BLANK=.): " fdd
	[[ -z $fdd ]] && fdd="."
	
	# Search keywords are entered here
	kw=( ".DS_Store" "*sync-conflict*" ".files" )
	for k in ${kw[*]} ; do
	findrm() {
		# if no matched files were found, return to the loop
		[[ -z "$ftd" ]] && printf "No files matching %s\n" "$k" && return 1 || printf "%s\n" "$ftd"
		# if matches were found, prompt user for removal
		simyn "Delete these files?" && find "$fdd" -path "./.stversions" -prune -false -o -name "$k" -exec rm -f {} \;
		unset ynsh
	}
	# exclude stversions dir - https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command
	ftd=$(find "$fdd" -path "./.stversions" -prune -false -o -name "$k") # files to delete
	findrm
	done
}
simyn "Do you want to run cleanup.sh?" && cleanupsh
unset kw
