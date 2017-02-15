#!/bin/bash
read -p "please input disk number:" num

dev=(`ls /dev/sd*`)

#for n in {0..7}
for ((n=0; n<$num; n=n+1))
do
        echo "${dev[$n]} $n"
done
