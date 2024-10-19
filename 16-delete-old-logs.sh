#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR $G Exists $N"
else
    echo "$SOURCE_DIR $G does not exists $N"
    exit 1
fi

FILES=$(find . -name "*.log" -mtime +14 -exec ls -lrt {} /;)

echo "Files=$FILES"

while IFS= read -r line
do
  echo "Deleting line: $line"
  #rm -rf $line
done <<< $FILES
