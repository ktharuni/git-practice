#!/bin/bash

USER=$(id -u)

if [ $? -ne 0 ]
then
    echo "Please check root access privileges"
    exit 1
fi

dnf list installed mysql-server

if [ $? -ne 0 ]
then
    echo "You are not yet installed...installing...."
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation is failed"
        exit 1
    else
        echo "mysql installation is successful"
    fi
else
    echo "mysql already installed"
fi