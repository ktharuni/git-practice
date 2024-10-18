#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privileges"
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R failed $N"
        exit 1
    else  
       echo -e "$2 is $G successful $N"
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