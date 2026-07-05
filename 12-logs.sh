#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then  
    echo "please run this script as root user"
    exit 1
fi
mkdir -p $LOGS_FOLDER
VALIDATE(){
    if [ $? -ne 0 ]; then
    echo "$2 ... failed"
    exit 1
else
    echo "$2 ... success"
fi
}


dnf install -y nginx &>>$LOGS_FILE
VALIDATE $? "installing nginx"

dnf install mysql-server -y & >> $LOGS_FILE
VALIDATE $? "installing mysql-server"

dnf install nodejs -y & >> $LOGS_FILE
VALIDATE $? "installing nodejs"


