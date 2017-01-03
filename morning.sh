#!/bin/bash
read -p "Say something to this world:" s
touch $s

tee -a $s >(logger) <<< "happy 2017,go go"

