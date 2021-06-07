#!/bin/bash
wget https://mirror.unej.ac.id/debian/pool/main/s/sslh/sslh_1.18-1_amd64.deb
dpkg -i *.deb
apt --fix-broken install -y
cat > /etc/default/sslh << "EOF" 
RUN=yes

DAEMON=/usr/sbin/sslh

DAEMON_OPTS='--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:222 --ssl 127.0.0.1:3128 --http 127.0.0.1:80 --openvpn 127.0.0.1:1194 --pidfile /var/run/sslh/sslh.pid'
EOF
sudo /etc/init.d/sslh restart
