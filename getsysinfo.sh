#!/bin/bash

# clear the screen
clear

unset msgcolor os architecture kernelrelease internalip externalip nameserver loadaverage

# Define Variable msgcolor
msgcolor=$(tput sgr0)

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e '\E[33m'"Network State: $msgcolor Connected" || echo -e '\E[33m'"Network State: $msgcolor Disconnected"

# Check OS Type
os=$(uname -o)
echo -e '\E[33m'"Operating System Type :" $msgcolor $os

# Check OS Release Version and Name
echo -n -e '\E[33m'"OS Name :" $msgcolor  && cat /etc/*release | grep 'PRETTY_NAME' | awk -F'"' '{print $2}'
echo -n -e '\E[33m'"OS Version :" $msgcolor && cat /etc/*release | cat /etc/*release | grep 'VERSION' | awk -F'"' '{print $2}' | head -n 1

# Check Architecture
architecture=$(uname -m)
echo -e '\E[33m'"Architecture :" $msgcolor $architecture

# Check Kernel Release
kernelrelease=$(uname -r)
echo -e '\E[33m'"Kernel Release :" $msgcolor $kernelrelease

# Check hostname
echo -e '\E[33m'"Hostname :" $msgcolor $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo -e '\E[33m'"Internal IP :" $msgcolor $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain; echo)
echo -e '\E[33m'"External IP : $msgcolor "$externalip

# Check DNS
nameservers=$(cat /etc/resolv.conf | grep 'nameserver' | awk '{print $2}')
echo -e '\E[33m'"Name Servers :" $msgcolor $nameservers 

# Check Logged In Users
echo -e '\E[33m'"Logged In users :" $msgcolor && who

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo -e '\E[33m'"Ram Usages :" $msgcolor
cat /tmp/ramcache | grep -v "Swap"
echo -e '\E[33m'"Swap Usages :" $msgcolor
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h | grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo -e '\E[33m'"Disk Usages :" $msgcolor 
cat /tmp/diskusage

# Check Load Average
loadaverage=`uptime | cut -d ' ' -f 13-20`
echo -e '\E[33m'"Load Average :" $msgcolor $loadaverage

# Check System Uptime
sysuptime=`uptime | cut -d ' ' -f 2,4-5 | tr -d ','`
echo -e '\E[33m'"System Uptime Days/(HH:MM) :" $msgcolor $sysuptime

# Unset Variables
unset msgcolor os architecture kernelrelease internalip externalip nameserver loadaverage

# Remove Temporary Files
rm -rf /tmp/ramcache /tmp/diskusage
