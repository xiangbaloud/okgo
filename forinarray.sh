#!/bin/bash

dev=(`ls /dev/sd*`)
num=7

for (( n=0; n<$num; n=n+1 ))
do
	echo " $n=${dev[$n]}"
done
