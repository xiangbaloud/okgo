#!/bin/bash

options=("apple" "banana" "orange")
PS3='Please select a function: '

select opt in "${options[@]}"
do
	case $REPLY in
		1 )  echo "you chose $opt"; break;;
		2 )  echo "you chose $opt"; break;;
		3 )  echo "you chose $opt"; break;;
		$((${#options[@]}+1)) ) echo "Goodbye!"; break;;
		*)  echo invalid option;;
	esac
done
