#!/bin/bash
#script by jiraphat yuenying for ubuntu 14.04
#install lamp

printf 'Set your Database password: '
read password

#service apache2 stop

#apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
apt-get remove --purge mysql-server php5-mysql -y
apt-get autoremove --purge -y
apt-get autoclean
#rm rm -Rf /etc/apache2 /usr/lib/apache2 /usr/include/apache2
rm -rf /etc/mysql
find / -iname 'mysql*' -exec rm -rf {} \;

timedatectl set-timezone Asia/Bangkok

apt-get update

#install apeche2
apt-get install apache2 -y

#install mysql
export DEBIAN_FRONTEND=noninteractive
apt-get install mysql-server php5-mysql -q -y
mysqladmin -u root password $password

#install php
apt-get install php5 libapache2-mod-php5 php5-mcrypt php5-curl -y
service apache2 restart

wget -O /etc/apache2/mods-enabled/dir.conf 'https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpnweb/dir.conf'

sudo a2enmod rewrite
service apache2 restart

wget -O /etc/apache2/sites-available/000-default.conf 'https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpnweb/000-default.conf'

service apache2 restart

rm -Rf /var/www/html
mkdir /var/www/html

wget -O /var/www/html/htdocs.tar 'https://github.com/jiraphaty/auto-script-vpn/raw/master/openvpnweb/htdocs_openvpn_final.tar'

cd /var/www/html/

tar xf htdocs.tar

rm htdocs.tar

MYIP=$(wget -qO- ipv4.icanhazip.com);
printf '###############################\n'
printf '# Script by Jiraphat Yuenying #\n'
printf '#                             #\n'
printf '#    '$MYIP'/install   #\n'
printf '###############################\n\n'
