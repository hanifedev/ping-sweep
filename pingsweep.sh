#!/bin/sh
ipadd=$(ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3)
for i in {1..254};
do
    ping -c 1 $ipadd.$i | grep -q icmp_req && echo -n "$ipadd.$i" 
done
