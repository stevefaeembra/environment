#!/bin/bash

# save the file as <git_directory>/.git/hooks/pre-commit.d/mvn_test and chmod +x

echo "Running mvn clean verify to catch any failing tests."

# Retrieving current working directory
#CWD=`pwd`
MAIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo $MAIN_DIR

# Go to main project dir
cd $MAIN_DIR/../..

# Command to be run.
CMD="mvn clean verify"
# Run command.
$CMD
# Get exit code from command.
RESULT=$?

#echo $RESULT

if [ ${RESULT} != 0 ]; then
  exit 1
fi
