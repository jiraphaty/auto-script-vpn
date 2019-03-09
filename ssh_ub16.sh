#!/bin/bash
#script by jiraphat yuenying

wget -O /etc/ssh/sshd_config 'https://raw.githubusercontent.com/jiraphaty/auto-script-vpn/master/sshd_config'

systemctl restart ssh
