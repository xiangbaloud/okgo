#!/bin/bash

vmlist=($(virsh list --all --name))

findvmdisk()
{
	local vmname=$1
	local match=0
	if [[ $1 == all ]]; then
		for vm in ${vmlist[@]}
		do
			os_disks=$(virsh domblklist $vm | grep 'sda\|vda' | awk '{print $2}')
			attach_disks=$(virsh domblklist $vm | grep -v 'sda' | awk '{print $2}' | sed '/^\s*$/d' | tail -n +2)
			if [[ -z $attach_disks ]]; then
				attach_disks=null
			fi
			printf "%s\n%s\n\n%s\n%s\n\n%s\n%s\n\n" "=== Hostname ===" $vm "== OS Disk ==" "$os_disks" "== Attach Disk ==" "$attach_disks"
		done
	else
		for vm in ${vmlist[@]}
		do
			if [[ $1 == $vm ]]; then
				local match=1
				break
			fi
		done
		if [[ $match == 0 ]]; then
			echo "Hostname not found, please check"
			exit 0
		fi
		os_disks=$(virsh domblklist $1 | grep 'sda\|vda' | awk '{print $2}')
		attach_disks=$(virsh domblklist $1 | grep -v 'sda' | awk '{print $2}' | sed '/^\s*$/d' | tail -n +2)
		if [[ -z $attach_disks ]]; then
			attach_disks=null
		fi
		printf "%s\n%s\n\n%s\n%s\n\n%s\n%s\n" "== Hostname ==" $1 "== OS Disk ==" "$os_disks" "== Attach Disk ==" "$attach_disks"
	fi
}

if [[ !$# -eq 1 ]]; then
	echo "[ERROR] argument missing" 
	exit 0
else
	for opt in $@
	do
		case $opt in
			-h|--help) echo "Usage: ./$0 [all] or give [VM name]"; exit 0;;
		esac
	done
fi

findvmdisk $1

