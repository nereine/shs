#!/usr/local/bin/bash
## Fix shell in newup

sedshell() {
	# Get simyn() from yn.sh
	# . $HOME/bin/yn.sh
	
	simyn "Change the first line of $1 to /usr/local/bin/bash?"	\
	&& sed -i.bak '1s,#!/bin/bash,#!/usr/local/bin/bash,' "$1"	\
	&& printf "ss.sh: done\n"

	# Show result (first line)
	head -n 1 "$1"
}
