#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privileges"
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "command failed to execute"
        exit 1
    else  
       echo "command exection successful"
    fi
}

dnf list installed git

if [ $? -ne 0 ]
then 
echo "Git is not installed...going to install it"
dnf install git -y
VALIDATE $?
else 
echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    VALIDATE $?
else 
echo "mysql is already installed"
fi