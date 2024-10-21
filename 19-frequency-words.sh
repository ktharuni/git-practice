#!/bin/bash

SOURCE_FILE=$1
COUNT=0
R="\e[31m"
G="\e[32m"
N="\e[0m"
 
  NUM=$(grep -i $SOURCE_FILE | wc -l)
  echo "$NUM"
