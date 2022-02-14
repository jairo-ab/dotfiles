!#/bin/bash

ip=$(/sbin/ip -o -4 addr list wlo1 | awk '{print $4}' | cut -d/ -f1)

echo "<txt>IP: ${ip}</txt>"
