#!/bin/env bash
# find.sh - stupid find script

if [[ -n "$2" ]]; then
	find . -type "$1" -name "*$2*"
else
	find . -name "*$1*"
fi
