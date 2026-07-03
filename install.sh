#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]; then  
    echo "please run this script as root user"
    exit 1
fi
echo "installing nginx web server"
dnf install -y nginxxx

if [ $? -ne 0 ]; then
    echo "nginx installed failed"
    exit 1
else
    echo "nginx installation success"
fi