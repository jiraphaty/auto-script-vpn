#!/bin/bash
#script by jiraphat yuenying for ubuntu 16.04
#install lamp

printf 'Set your Database password: '
read password

#service apache2 stop
#apt-get purge apache2 apache2-utils apache2.2-bin apache2-common
apt-get remove --purge mysql-server php-mysql -y
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
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$password
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$password
sudo apt-get -y install mysql-server

#install php
apt-get install php libapache2-mod-php php-mcrypt php-mysql php-curl -y
systemctl restart apache2

wget -O /etc/apache2/mods-enabled/dir.conf 'https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpnweb/dir.conf'

sudo a2enmod rewrite
systemctl restart apache2

wget -O /etc/apache2/sites-available/000-default.conf 'https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/openvpnweb/000-default.conf'

systemctl restart apache2

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
