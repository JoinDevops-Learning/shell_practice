#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m" #RED
G="\e[32m" #GREEN
Y="\e[33m" #YELLOW
B="\e[34m" #BLUE
M="\e[35m" #MAGENTA
C="\e[36m" #CYAN  
N="\e[0m"  #NO COLOR

if [ $USERID -ne 0 ]; then  
    echo -e "$R please run this script as root user $N" | tee -a $LOGS_FILE
    exit 1
fi
mkdir -p $LOGS_FOLDER
VALIDATE(){
    if [ $? -ne 0 ]; then
    echo -e "$R $2 ... failed $N" | tee -a $LOGS_FILE # -a append the logs to the file
    exit 1
else
    echo -e "$G $2 ... success $N" | tee -a $LOGS_FILE
fi
}

for package in $@ # sudo sh 15-logs-loops.sh nginx mysql-server nodejs
do
    dnf install -y $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo -e "$Y $package not installed, installing now $N" | tee -a $LOGS_FILE
        dnf install -y $package &>>$LOGS_FILE
        VALIDATE $? "installing $package"
    else
        echo -e "$G $package already installed skipping $N" | tee -a $LOGS_FILE
    fi
    

done


