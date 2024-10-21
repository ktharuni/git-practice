#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]#CHECK_ROOT() FUNCTION USE IT IF NEEDED
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

for package in $@
do
dnf list installed $package
if [ $? -ne 0 ]
then 
echo "$package is not installed...going to install it"
dnf install $package -y
VALIDATE $? "Installing $package"
else 
echo "$package is already installed"
fi
done
