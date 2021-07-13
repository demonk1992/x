#!/bin/bash
# update upgrade
export DEBIAN_FRONTEND=noninteractive
apt-get update; apt-get -y dist-upgrade;
apt-get install -y ca-certificates apt-transport-https lsb-release screen unzip wget curl git netcat tcpd tor build-essential zlib1g-dev libsctp-dev cmake make gcc zlib1g-dev libwrap0-dev certbot tor perl libperl-dev libgd3 libgd-dev libgeoip1 libgeoip-dev geoip-bin libxml2 libxml2-dev libxslt1.1 libxslt1-dev build-essential git tree libpcre3-dev socket dh-autoreconf libssh-4 libssh-dev libconfig9 lolcat mercurial
# Create and Configure rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
exit 0
END
# Banner
cat > /etc/idssh.net <<-END
<h6><font color='blue'>IDSSH.XYZ</font></h6>
END
# Ubah ijin akses
chmod +x /etc/rc.local
# Create rc.d
mkdir /etc/rc.d
chmod +x /etc/rc.d
cat > /etc/rc.d/rc.local <<-END
#!/bin/sh -e
exit 0
END

# Ubah ijin akses
chmod +x /etc/rc.d/rc.local
# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
#  set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart
# dsable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
# set ipv4 forward
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i 's|#net.ipv4.ip_forward=1|net.ipv4.ip_forward=1|' /etc/sysctl.conf
# Upgrade openssl
wget https://raw.githubusercontent.com/demonk1992/x/main/openssl.sh && chmod +x openssl.sh && screen -S openssl ./openssl.sh
# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/demonk1992/down/main/password"
chmod +x /etc/pam.d/common-password
# sslh
wget https://raw.githubusercontent.com/demonk1992/x/main/sslh.sh && chmod +x sslh.sh && screen -S sslh ./sslh.sh
# Install badvpn deb/ubun
wget https://raw.githubusercontent.com/demonk1992/x/main/badvpn.sh && chmod +x badvpn.sh && screen -S badvpn ./badvpn.sh
# Dropbear
wget https://raw.githubusercontent.com/demonk1992/x/main/dropbear.sh && chmod +x dropbear.sh && screen -S dropbear ./dropbear.sh
# Nginx
wget https://raw.githubusercontent.com/demonk1992/x/main/nginx.sh && chmod +x nginx.sh && screen -S nginx ./nginx.sh
# Websockets-SSH-OPENVPN
wget https://raw.githubusercontent.com/demonk1992/down/main/websocket.sh && chmod +x websocket.sh && screen -S websocket ./websocket.sh
# Stunel
wget https://raw.githubusercontent.com/demonk1992/x/main/stunnel.sh && chmod +x stunnel.sh && screen -S stunnel ./stunnel.sh
# Boost TCP
wget https://raw.githubusercontent.com/demonk1992/x/main/tcp.sh && chmod +x tcp.sh && screen -S tcp ./tcp.sh
# v2ray
wget https://multi.netlify.app/v2ray.sh && chmod +x v2ray.sh && screen -S v2ray ./v2ray.sh
# Setup l2tp
wget https://github.com/demonk1992/vps/raw/main/vpn-install.tar.gz && tar -xf vpn-install.tar.gz && chmod +x vpn-install/* && screen -S sudo bash vpn-install/ipsec/install.sh
# Openvpn
wget https://raw.githubusercontent.com/demonk1992/down/main/vpn.sh && chmod +x vpn.sh && screen -S vpn ./vpn.sh
# usernew
cd /usr/bin
wget -O usernew "https://raw.githubusercontent.com/demonk1992/x/main/usernew.sh"
chmod +x usernew
cd
# Screenfetch
wget https://raw.githubusercontent.com/demonk1992/x/main/screenfetch.sh && chmod +x screenfetch && screen -S screenfetch ./screenfetch.sh
# Webmin
wget https://raw.githubusercontent.com/demonk1992/x/main/webmin.sh && chmod +x webmin.sh && screen -S webmin ./webmin.sh
# Squid
wget https://raw.githubusercontent.com/demonk1992/x/main/squid.sh && chmod +x squid.sh && screen -S squid ./squid.sh
#
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : UDP 1194"  | tee -a log-install.txt
echo "   - Stunnel4                   : 3128"  | tee -a log-install.txt
echo "   - Ssl                              : 443"  | tee -a log-install.txt
echo "   - Dropbear                  : 222"  | tee -a log-install.txt
echo "   - Badvpn                     : 7100, 7200, 7300, 7400, 7500, 7600, 7700, 7800, 7900"  | tee -a log-install.txt
echo "   - Nginx                        : 8443"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - User Name               : Demonk"  | tee -a log-install.txt
echo "   - Telegram                : T.me/sunatmasal"  | tee -a log-install.txt
echo "   - Whatsapp                : 082119813096"  | tee -a log-install.txt
echo "=================================-Autoscript-===========================" | tee -a log-install.txt
echo ""
rm -f x.sh
