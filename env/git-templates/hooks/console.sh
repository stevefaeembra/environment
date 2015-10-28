#!/usr/bin/env bash

###
#
# This script checks to ensure there are no occurrences of:
#
#    * console.log
#    * console.debug
#    * console.error
#    * console.info
#    * console.warn
#
# If any of these are found the script exits without committing the code, to allow you
# to delete the lines containing any of this code.
#
###


# Abort "git commit" if JavaScript console statements are found, reports file and line number of offending line.
# Put this into .git/hooks/pre-commit and chmod 744 it.
FILES_PATTERN='\.(js|jsp|html)(\..+)?$'
FORBIDDEN='console.(log|debug|error|info|warn)'


MESSAGE="\033[1;31mCOMMIT REJECTED: Found 'console.log|debug|error|info|warn, remove these lines before committing.\033[m

In base directory of your project, type:

\t\033[1;34mprompt>for f in \`find . -regex \".*\(js\|jsp\|html\)$\"\`; do grep -Ev 'console.' $f > $f.new; mv $f.new $f; done\033[m

Add/remove file extensions as you require.
"

# git diff --cached --name-only | grep -E $FILES_PATTERN | xargs egrep --color --with-filename -n $FORBIDDEN && echo "$MESSAGE";
git diff --cached --name-only | grep -E $FILES_PATTERN | GREP_COLOR='4;5;37;41' xargs egrep --color --with-filename -n $FORBIDDEN && echo -e "$MESSAGE";

# my zsh does annoying things with !
[ $? -ne 0 ]
