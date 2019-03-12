#!/bin/bash
#script by jiraphat yuenying

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (วัน): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====สร้าง User===="
echo -e "Host: $IP" 
#echo -e "Port OpenSSH: 22,80"
#echo -e "Port Dropbear: 143,443"
echo -e "Squid: 8080,3128"
#echo -e "Config OpenVPN (TCP 1194): http://$IP:81/client.ovpn"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "วันหมดอายุ : $exp"
echo -e "============================="
echo -e "Made by Jiraphat Yuenying"
echo -e ""
