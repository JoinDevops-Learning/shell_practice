#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then  
    echo "please run this script as root user"
    exit 1
fi
VALIDATE(){
    if [ $? -ne 0 ]; then
    echo "$2 ... failed"
    exit 1
else
    echo "$2 ... success"
fi
}
echo "installing nginx web server"

dnf install -y nginx
VALIDATE $? "installing nginx"

dnf install mysql-server -y
VALIDATE $? "installing mysql-server"

dnf install nodejs -y
VALIDATE $? "installing nodejs"


