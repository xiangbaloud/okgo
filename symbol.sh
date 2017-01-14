#!/bin/bash

a=$1

abc()
{
if [ "$a" == "0" ];then
	echo " this is 0 "
else 
	return 1
fi
}

abc || echo " $a is not 0 "

