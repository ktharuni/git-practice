#!/bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 installation is $R failed $N"
        exit 1
    else
        echo -e "$2 installation is $G successful $N"
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

dnf list installed nodejs

if [ $? -ne 0 ]
then
    echo "nginx is not yet installed...installing...."
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e "nginx $G already installed $N"
fi