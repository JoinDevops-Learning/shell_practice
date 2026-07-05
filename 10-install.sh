#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then  
    echo "please run this script as root user"
    exit 1
fi
echo "installing nginx web server"
dnf install -y nginx

if [ $? -ne 0 ]; then
    echo "nginx installed failed"
    exit 1
else
    echo "nginx installation success"
fi

dnf install mysql-server -y
if [ $? -ne 0 ]; then
    echo "mysql-server installed failed"
    exit 1
else
    echo "mysql-server installation success"
fi
dnf install nodejs -y
if [ $? -ne 0 ]; then
    echo "nodejs installed failed"
    exit 1
else
    echo "nodejs installation success"
fi


