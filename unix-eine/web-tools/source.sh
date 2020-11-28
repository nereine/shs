#!/usr/bin/env bash
# source files-to-source (fts)

# source functions from files
source_fff() {
	typeset -a fts=("$HOME/bin/yn.sh" "$HOME/bin/lb.sh")
	for s in "${fts[@]}" ;
		do [[ -x "$s" ]] && . "$s"\
		|| printf "source.sh: couldn't source functions from $fts\n";
	done
}
# run external commands
run_ext_commands() {
		. "$1"\
		|| printf "source.sh: couldn't source external command $fts\n";
}
source_fff && fts_status="ok" && printf "source.sh: %s; source_functions() ready.\n" "$fts_status" || fts_status="failed"
