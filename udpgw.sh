#!/bin/bash
wget https://github.com/ambrop72/badvpn/archive/1.999.130.tar.gz && tar xzf 1.999.130.tar.gz
mkdir badvpn-build
cd badvpn-build
cmake ~/badvpn-1.999.130 -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
chmod +x /usr/local/bin/badvpn-udpgw
wget -O /etc/systemd/system/udpgw.service "https://raw.githubusercontent.com/demonk1992/x/main/udpgw.service"
chmod +x /etc/systemd/system/udpgw.service
sudo useradd -m udpgw
sudo systemctl enable udpgw
sudo systemctl start udpgw
