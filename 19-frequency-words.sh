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
   WORD=$(awk -F " " '{print $($i)F}')
   for j in {1...N}
   do
   COMPARE_WORDS=$(awk -F " " '{print $($j)F}')
   if [ WORD -et COMPARE_WORDS ]
   then
   COUNT=$COUNT+1
   fi
   done
   COUNT=$COUNT-1
   echo -e "$G $WORD $N : $R $COUNT $N"
   done
done <<< $SOURCE_FILE