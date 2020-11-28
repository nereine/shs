#!/usr/bin/env bash
# lb.sh (line break) - use tput to get terminal width $w and then print $w white spaces, which will later be changed by sed to =
line() {
	[[ -z "$vantput" ]] && [[ -z $"$(command -v tput)" ]] && export vantput="nem" && return 1 || printf "%$(tput cols)s\n"|sed "s/ /=/g"
}
