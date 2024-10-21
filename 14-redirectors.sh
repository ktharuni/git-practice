#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]
then 
    echo "$R Please run this script with root privileges $N" | tee -a $LOG_FILE
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N" | tee -a $LOG_FILE
        exit 1
    else  
       echo -e "$2 is $G successful $N" | tee -a $LOG_FILE
    fi
}
USAGE(){
    echo "$R Usage: $N sudo sh 14-redirectors.sh package1 package2....."
    exit 1
} 
echo "Script started execution at $(date)" | tee -a $LOG_FILE
if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
dnf list installed $package &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
echo -e "$Y $package is not installed...going to install it $N" | tee -a $LOG_FILE
dnf install $package -y &>> $LOG_FILE
VALIDATE $? "Installing $package" 
else 
echo -e "$Y $package is already installed $N" | tee -a $LOG_FILE
fi
done