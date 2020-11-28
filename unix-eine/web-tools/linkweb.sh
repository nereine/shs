#!/usr/bin/env bash
# linkweb.sh - link files for ssg5
# Markdown and HTML locations
mdir=("md")
hdir=("html")

# Source files
headf="../resources/_header.html"
footf="../resources/_footer.html"
scssf="../resources/style.css"
#logof="../resources/2f.svg"

for d in ${mdir[@]} ; do
	ln -sf $headf "$d/_header.html"
	ln -sf $footf "$d/_footer.html"
	ln -sf $scssf "$d/style.css"
#	ln -sf $logof "$d/favicon.ico"
done

for d in ${hdir[@]} ; do
#	ln -sf $logof "$d/favicon.ico"
	ln -sf $scssf "$d/style.css"
done
