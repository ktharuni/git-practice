#!/bin/bash

SOURCE_FILE=$1
COUNT=0
R="\e[31m"
G="\e[32m"
N="\e[0m"

while IFS= read -r line
do 
   for i in {1...N}
   do
   WORD=$(awk -F " " '{print $($iF)})
   for j in {1...N}
   do
   COMPARE_WORDS=$(awk -F " " '{print $($jF)})
   if [ WORD -et COMPARE_WORDS ]
   then
   COUNT=$COUNT+1
   fi
   done
   COUNT=$COUNT-1
   echo "$G $WORD $N : $R $COUNT $N"
   done
done <<< $SOURCE_FILE