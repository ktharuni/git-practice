#!/bin/bash

USER=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 installation is failed"
        exit 1
    else
        echo "$2 installation is successful"
    fi
}

if [ $? -ne 0 ]
then
    echo "Please check root access privileges"
    exit 1
fi

dnf list installed mysql-server

if [ $? -ne 0 ]
then
    echo "mysql is not yet installed...installing...."
    dnf install mysql-server -y
    VALIDATE $? mysql
else
    echo "mysql already installed"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx is not yet installed...installing...."
    dnf install mysql-server -y
    VALIDATE $? nginx
else
    echo "nginx already installed"
fi