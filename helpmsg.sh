#!/bin/bash
function helpmsg()
{
	echo "Usage:"
	echo " $0 --options:parameter"
	echo "Options:"
	echo " (1) --option:"
	echo " (2) --option:"
	echo " (3) --option:"
	echo " (4) --option:"
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
