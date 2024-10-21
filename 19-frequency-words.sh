#!/bin/bash

SOURCE_FILE=$1
COUNT=0
R="\e[31m"
G="\e[32m"
N="\e[0m"

while IFS= read -r line
do 
  NUM=$(grep -i $line | wc -l)
  echo "$NUM"
done <<< $SOURCE_FILE