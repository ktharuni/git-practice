#!/bin/bash

PACKAGE=$1

for PACKAGE in $@
do 
    dnf list installed $PACKAGE
    if [ $? -ne 0 ]
    then 
        echo "$PACKAGE is not yet installed...installing now"
        dnf install $PACKAGE -y
    else
        echo "$PACKAGE is already installed"
    fi
done
   