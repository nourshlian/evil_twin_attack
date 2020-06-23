#!/bin/bash

ap_bssid=$1
ap_ch=$2
interface=$3
airodump-ng $interface --bssid $ap_bssid --channel $ap_ch --write .handshake
