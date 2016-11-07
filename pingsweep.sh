#!/bin/sh
sayac=0
ipadd=$(ifconfig | grep "broadcast" | cut -d " " -f 10 | cut -d "." -f 1,2,3)
for i in {1..254};
do
    ping -c 1 $ipadd.$i
    if [ $(ping -c 1 $ipadd.$i | grep icmp* | wc -l) -gt 0 ]
    then
        let sayac+=1
    fi
done
if [ $sayac -eq 0 ]
then
    echo "Aktif host yoktur"
else
    echo "Aktif bilgisayar sayısı : " $sayac
fi
