#!/bin/bash

## This script sources external files (lb.sh, yn.sh, sendweb.sh, and cleanup.sh), which are provided in my "sh-tools/web-tools" from gitlab.com/artnoi-staple/unix.

## genhtml uses ssg5 to generate static HTML web pages from Markdown files
## To use this script, you must first specify "webdirs" array.
## webdirs value which Markdown locations as well as their corresponding HTML counterpart (e.g. md-artnoi.com and html-artnoi.com).

genhtml() {
	# Our website associative arrays: ["md-dir"]="html-dir"
	typeset -A webdirs
	webdirs[md]="html"
	
	# See https://linuxconfig.org/how-to-use-arrays-in-bash-script	
	for web in "${!webdirs[@]}" ;
		do  simyn "Generate html for ${web}"\
		&& ssg5 "${web[@]}" "${webdirs[$web]}" "Artnoi.com" "https://artnoi.com";
	done
}

# Actual execution starts here
[[ "$fts_status" != "ok" ]] && . "source.sh"
# Delete .DS_Store, .files (to reset ssg), and other annoying files
run_ext_commands "cleanup.sh"
# Generate HTML files
genhtml
# run web.sh after new files are generated
run_ext_commands "sendweb.sh"
