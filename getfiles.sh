#!/bin/sh

# This script takes all my important dotfiles and puts them into another
# directory.
#
# Made by LONYELON (lonyelon@lony.xyz)

#                                                                       OPTIONS
###############################################################################

FILE="files.txt"

#                                                                          CODE
###############################################################################

# Shows help and all options
help() {
	echo "usage: $0 [OPTIONS] [FILE_LIST]"
	echo ""
	echo "FILE LIST"
	echo "FILE_LIST has to be the path to a file containing a list of files to backup. The list must be in plain text format and paths must be separated by new lines, for example:"
	echo "\t.file1"
	echo "\tfile2"
	echo "\tdir0/file3"
	echo ""
	echo "OPTIONS"
	echo "\t-h\tShow this help"
	echo "\t-c\tClear, will erase the contents of the current directory and not copy any files to it"
	echo "\t-v\tToggle verbose output"
}

# Initial values
clean=0
verbose=0

# Check options
while getopts 'hcv' OPTION; do
    case "$OPTION" in
		c) clean=1;;
		v) verbose=1;;
        h) help && exit 0;;
        *) help >&2 && exit 1;;
    esac
done

# Delete all files in this directory
for f in $(ls -a); do
	[ "$f" != "getfiles.sh" ] && [ "$f" != "$FILE" ] && [ "$f" != "." ] && [ "$f" != ".." ] && [ "$f" != ".git" ] && rm -rf $f && [ $verbose -eq 1 ] && echo "Deleted\t$f"
done

# Copy all files
if [ $clean -ne 1 ]; then
	while read line; do
		path="/home/$(whoami)/$line"
		[ -f $path ] && dir=$(echo $line | sed -r "s/\/?[A-Za-z0-9á-ź\ _\.,;\-\+\*]+$//") && mkdir -p $dir 2> /dev/null && [ $verbose -eq 1 ] && echo "Created\t$dir"
		cp -r $path ./$dir
		[ $verbose -eq 1 ] && echo "Copied\t$path"
	done<$FILE
fi
