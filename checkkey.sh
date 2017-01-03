#!/bin/bash 

# -s: do not echo input character. -n 1: read only 1 character (separate with space)
read -p "please press any key: " -s -n1 key

# double brackets to test, single equals sign, empty string for just 'enter' in this case...
# if [[ ... ]] is followed by semicolon and 'then' keyword
if [[ $key = "" ]]; then 
    echo 'You pressed enter!'
else
    echo "You pressed '$key'"
fi
