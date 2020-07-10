#!/bin/bash

# give the NIC at the first arg


interface=$1

ifconfig $interface down
iwconfig $interface mode monitor
ifconfig $interface up

