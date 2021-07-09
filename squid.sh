#!/bin/bash
MYIP=$(wget -qO- ifconfig.me);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/demonk1992/x/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf