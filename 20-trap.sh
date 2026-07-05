#!/bin/bash
set -e # this will stop the script if any command fails

trap 'echo "error occured at line no: $LINENO, command: $BASH_COMMAND"' ERR

echo "hello world"
echo "i am learning shell scripting"
echoo "printing error here" # this will throw error and script will stop executing because of set -e
echo "no error in this"