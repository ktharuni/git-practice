#!/bin/bash

NUMBER=$1
PERSON=$2

if [ $NUMBER -gt 18 ]
then
     echo "$PERSON is eligible to vote for elections"
else
     echo "$PERSON is not eligible to vote for elections"
fi