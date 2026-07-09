#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR="/home/ec2-user/app-logs"
LOGS_FILE="/var/log/shell-script/$0.log" #logs deleted files.

if [ ! -d "$LOGS_DIR" ]; then
    echo -e "$R $LOGS_DIR does not exist, please check the path $N" 
    exit 1
fi
FILES_TO_DELETE=$(find $LOGS_DIR  -mtime +14)
#echo "$FILES_TO_DELETE"

while IFS= read -r line; do #internal field separator, read line by line from the file
  #Process each line here
 echo "deleting file:$line"
 rm -f $line
 echo "deleted file:$line" 
done <<< "$FILES_TO_DELETE" # input which file to read 
# if u read from a variable, use <<< instead of <