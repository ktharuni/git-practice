#!/bin/bash

echo "Please enter name of person1:"

read PERSON1

echo "Please enter name of person2:"

read -s PERSON2

echo "$PERSON1: Hey ${PERSON2}, how’s it going?"

echo "${PERSON2}: Good, $PERSON1! Been busy with work. What about you?"

echo "$PERSON1: Same here, but I went hiking last weekend. It was amazing!"

echo "${PERSON2}: That sounds awesome! Where did you go?"

echo "$PERSON1: Sundar Hills. You should come next time!"

echo "${PERSON2}: I’m in! Let’s plan it."

echo "$PERSON1: Great, I’ll check my schedule and let you know."