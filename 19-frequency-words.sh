#!/bin/bash

SOURCE_FILE=$1
COUNT=0
R="\e[31m"
G="\e[32m"
N="\e[0m"
 
while IFS= read -r line #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
do
  NUM=$($line| wc -l)
  echo "$NUM"
done <<< $SOURCE_FILE
