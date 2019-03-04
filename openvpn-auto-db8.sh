#!/bin/bash
#script by jiraphat yuenying for debian8
#install openvpn

apt-get update
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

echo MYIP
