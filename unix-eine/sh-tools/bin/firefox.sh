#!/usr/bin/env bash
# firefox.sh - launch Firefox with specific environment variable

# Source environment table from firefox.sh.conf
. $HOME/bin/firefox.sh.conf
firefox $1
