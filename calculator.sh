#!/bin/bash

addition=0
subtraction=0
multiplication=0
division=0

usage()
{
	echo "Usage: This is simple calculator"
	echo "Select one operator from 1 to 4 and give numbers to operate, like this: 3 9990 5"
	echo "  1) addition"
	echo "  2) subtraction"
	echo "  3) multiplication"
	echo "  4) division"
}

if [[ $# == 0 ]];then
	usage
	exit 0
else
	for opt in $@
	do
		case "$opt" in
			1)	addition=1 && result=$(echo $2 + $3 |bc); echo $result; exit 0;;
			2)	subtraction=1 && result=$(echo $2 - $3 |bc); echo $result; exit 0;;
			3)	multiplication=1 && result=$(echo $2 \* $3 |bc); echo $result; exit 0;;
			4)	division=1 && result=$(echo $2 / $3 |bc); echo $result; exit 0;;
			*)	echo "invalid option"; exit 0;;		
		esac
	done
fi
