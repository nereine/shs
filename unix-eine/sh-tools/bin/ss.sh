#!/usr/bin/env bash
## Fix shell in newup

# Get simyn() from yn.sh
. $HOME/bin/yn.sh || return

aftersed() {
	printf "ss.sh: done\n"
	# Show result (first line)
	head -n 1 "$1"
}

sedmac() {
	simyn "Change the first line of $1 to #!/usr/local/bin/bash?" \
	&& sed -i.bak '1s,#!/bin/bash,#!/usr/local/bin/bash,' "$1"	\
	&& aftersed "$2"
}

sedshell() {
	simyn "Change the first line of $2 to #!/usr/bin/env $1?" \
	&& sed -i.bak "1c #!/usr/bin/env $1" "$2"
}

sedshell "$1" "$2"
aftersed "$2"
