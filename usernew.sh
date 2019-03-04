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
  fi
else
   echo "User must not empty"
fi
