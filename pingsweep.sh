#!/bin/sh
for i in {1..254};
do
    ping $(ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3).$i
done
