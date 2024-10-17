#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

if [ $? -ne 0]
then 
echo "Git is not installed...going to install it"
dnf install git -y
if [ $? -ne 0 ]
then
echo "git installation failed"
exit 1
else 
echo "git installation successful"
fi
else 
echo "Git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0]
then 
echo "mysql is not installed...going to install it"
dnf install mysql -y
if [ $? -ne 0 ]
then
echo "mysql installation failed"
exit 1
else 
echo "mysql installation successful"
fi
else 
echo "mysql is already installed"
fi
