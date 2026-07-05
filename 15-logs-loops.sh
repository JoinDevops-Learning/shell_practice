#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then  
    echo "please run this script as root user" | tee -a $LOGS_FILE
    exit 1
fi
mkdir -p $LOGS_FOLDER
VALIDATE(){
    if [ $? -ne 0 ]; then
    echo "$2 ... failed" | tee -a $LOGS_FILE # -a append the logs to the file
    exit 1
else
    echo "$2 ... success" | tee -a $LOGS_FILE
fi
}

for package in $@ # sudo sh 15-logs-loops.sh nginx mysql-server nodejs
do
    dnf install -y $package &>>$LOGS_FILE
    VALIDATE $? "installing $package"

done


