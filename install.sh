#!/bin/bash
USERID=$(id -u)

if [ $USERID -nq 0 ]; then  
    echo "please run this script as root user"
    exit 1
fi
echo "installing nginx web server"
dnf install -y nginx