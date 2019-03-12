#!/bin/bash
#Script auto create trial user SSH
#Create by Jiraphat Yuenying

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====trial SSH account===="
echo -e "Host: $IP" 
#echo -e "Port OpenSSH: 22,80"
#echo -e "Port Dropbear: 143,443"
echo -e "Squid: 8080,3128"
#echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "Username: $Login"
echo -e "Password: $Pass\n"
echo -e "========================="
echo -e "Create by Jiraphat Yuenying"
echo -e ""
