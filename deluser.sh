#!/bin/bash
# Script delete user SSH
# Created by Jiraphat Yuenying

read -p "Delete User : " Nama

userdel -r $Nama
