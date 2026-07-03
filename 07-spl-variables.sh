#!/bin/bash 
echo "all args passed to script are $@" 
echo "total args passed to script are $#"
echo "script name is $0"
echo "first arg passed to script is $1"
echo "present directory is $PWD"
echo "home directory is $HOME"
echo "current user is $USER"
echo "current shell is $SHELL"
echo "current process id is $$"
sleep 100 & # run sleep command in background
echo "PID of last background process is $!"