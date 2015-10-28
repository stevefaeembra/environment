#!/usr/bin/env bash

###
#
# This script checks to ensure there are no tabs in the file(s) to be commited.
# If tabs are found the script exits without committing the code, to allow you
# to change tabs to spaces.
#
###

MESSAGE="\033[1;31mCOMMIT REJECTED: Found tabs, replace with spaces before committing.\033[m

In base directory of your project, type:

\t\033[1;34mprompt>for f in \`find src -regex \".*\(java\|js\|xml\|properties\)$\"\`; do expand -t2 $f > $f.new; mv $f.new $f; done\033[m

Add/remove file extensions as you require.
"

# Find tabs in staged files and output message 
git diff --cached --name-only | GREP_COLOR='4;5;37;41' xargs grep --color --with-filename -P "\t" && echo -e "$MESSAGE"

# Exit without committing files.
[ $? -ne 0 ]
