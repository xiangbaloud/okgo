#!/bin/bash

PS3='Please select a function: '
options=("Option 1" "Option 2" "Option 3" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Option 1")	echo "you chose choice 1";;
        "Option 2")	echo "you chose choice 2";;
        "Option 3")	echo "you chose choice 3";;
        "Quit")         exit;;
        *) 		echo invalid option;;
    esac
done
