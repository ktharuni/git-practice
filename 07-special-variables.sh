#!/bin/bash

echo "pass all variables: $@"
echo "number of variables passed:$#"
echo "script name that is running:$0"
echo "current waorking directory:$PWD"
echo "home directory of current user:$HOME"
echo "PID of script that executing:$$"
sleep 100 &
echo "PID of last backgroung command:$!" 