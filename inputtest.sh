#!/bin/bash

function ddlong()
{
    ls -ashl
}

function wait_key()
{
        echo "Press Enter to continue ..."
        read
}
#------------------------------------------------------------------------------------------------------------------------------------------------------------
version=1.0
function helpmsg() 
{
	echo "Usage:"
	echo " $0 --options:parameter"
	echo "Options:"
	echo " (1) --wait：Wait Mode"
	echo " (2) --no-wait：No Wait Mode"	   
	echo " (3) --compile-only：Only Compile"
	echo " (4) --run-test-only：Test Only"
	echo " (5) --version --help"
	echo "     [--version] show the version number"
	echo "     [--help] show this help"
}

if [ $# -eq 0 ]; then
	helpmsg
	exit
else
	for opt in "$@"
	do
		case "$opt" in
			--version)				echo $version
									exit;;
			--help)					helpmsg
									exit;;
		esac
	done
fi
#------------------------------------------------------------------------------------------------------------------------------------------------------------
ddlong
wait_key
