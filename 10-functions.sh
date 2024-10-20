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
        echo "$2 is failed"
        exit 1
    else  
       echo "$2 is successful"
    fi
}

dnf list installed git

if [ $? -ne 0 ]
then 
echo "Git is not installed...going to install it"
dnf install git -y
VALIDATE $? "Installing git"
else 
echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else 
echo "mysql is already installed"
fi