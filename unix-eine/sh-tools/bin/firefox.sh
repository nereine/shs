#!/bin/sh
# firefox.sh - launch Firefox with specific environment variable

# Source environment table from firefox.sh.conf
ffconf="$HOME/bin/priv/firefox.sh.conf";
[ -f "$ffconf" ]\
&& . $ffconf;

firefox "$1";
