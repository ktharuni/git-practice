#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
R="\e[31m"
G="\e[32m"
N="\e[0m"

USAGE()
{
    echo -e "$R Usage : $N sh backup.sh <source dir> <destination dir> <days(optional)>
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "source directory does not exists"
fi
if [ ! -d $DESTINATION_DIR ]
then
    echo "destination directory does not exists"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "files:$FILES" 

#if [ -n $FILES ]
#then 
#    echo "files found"
#else
# echo "files does not found which are older than $DAYS"
#fi