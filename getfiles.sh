#!/bin/sh

# This script takes all my important dotfiles and puts them into another
# directory.
#
# Made by Lonyelon (lonyelon@lony.xyz)

# ---- VARIABLES ----
FILE="files.txt"

# ---- CODE ----

for f in $(ls -a); do
	[ "$f" != "getfiles.sh" ] && [ "$f" != "$FILE" ] && [ "$f" != "." ] && [ "$f" != ".." ] && [ "$f" != ".git" ] && rm -rf $f && echo "Deleted\t$f"
done

if [ "$1" != "clean" ]; then
	while read line; do
		path="/home/$(whoami)/$line"
		[ -f $path ] && dir=$(echo $line | sed -r "s/\/?[A-Za-z0-9á-ź\ _\.,;\-\+\*]+$//") && mkdir -p $dir 2> /dev/null && echo "Created\t$dir"
		cp -r $path ./$dir
		echo "Copied\t$path"
	done<$FILE
fi
