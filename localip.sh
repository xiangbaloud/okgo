#!/bin/bash

ipinfo=`ifconfig`

etho=${ipinfo%%  Bcast:*}
etho=${etho##*inet addr:}
tapo=${ipinfo##*tap0}
tapo=${tapo%%  Bcast:*}
tapo=${tapo##*inet addr:}
lo=${ipinfo##*:Local Loopback}
lo=${lo%%  Mask:*}
lo=${lo##*inet addr:}

echo " Local internet IP addresses: "
echo " eth0: $etho "
echo " tap0: $tapo "
echo " lo: $lo "

