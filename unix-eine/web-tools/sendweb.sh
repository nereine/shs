#!/bin/bash

## This script sources external files (lb.sh, yn.sh, sendweb.sh, and cleanup.sh), which are provided in my "sh-tools/web-tools" from gitlab.com/artnoi-staple/unix.

[[ "$fts_status" != "ok" ]] && source "source.sh"

##	sendweb.sh - send HTML pages in directories starting with "keyword" to $dest destination

sendweb() {
	# Destination can be either (1) your server's actual IP address (2) your server's ssh alias
	dest="nereine.xyz:~/web/."
	# Search keyword in the directory names
	skw="html"
	
	# Search one-level for directories with names matching $skw
	declare -a kw=$(find . -maxdepth 1 -name "$skw" -type d)
	for d in ${kw[*]} ;
		do simyn "Send $d to $dest later?" && line\
		&& printf "Sending %s\n" "$d"\
		&& scp -r "$d" "$dest/.";
		run_ext_commands "$HOME/bin/lb.sh";
	done
}
## Actual execution starts here
simyn "Do you want to run sendweb.sh?" && sendweb ; unset dest
