#!/bin/bash

allarg=$@
host=`echo $allarg | grep '10'`

sshkengen()
{
    if [[ -f /root/.ssh/id_rsa ]]; then
        ssh-copy-id $host
    else
        ssh-keygen -t rsa -N "" -f /root/.ssh/id_rsa
        ssh-copy-id $host
    fi
}

sshkengen
ssh $host
