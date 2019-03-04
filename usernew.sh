#!/bin/bash
#script by jiraphat yuenying

read -p "User : " user
if [ ! -z "$user" ]
then
useradd $user
  read -p "Password : " password
  if [ ! -z "$password" ]
  then
    echo -e "$password\n$password\n"|passwd
    read -p "Expire : " day
    if [ ! -z "$day" ]
    then
      echo -e "chage -E $(date -d +30days +%Y-%m-%d) $user"
    else
      echo -e "chage -E $(date -d +$daydays +%Y-%m-%d) $user"
  else
    echo "Password must not empty"
  fi
else
   echo "User must not empty"
fi
