wget https://github.com/ambrop72/badvpn/archive/1.999.130.tar.gz && tar xzf 1.999.130.tar.gz
mkdir badvpn-build
cd badvpn-build
cmake ~/badvpn-1.999.130 -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
make install
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &' /etc/rc.d/rc.local
# Allow Script Badvpn
chmod +x /usr/local/bin/badvpn-udpgw
# Start Badvpn
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7000 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 1000 --max-connections-for-client 1000 > /dev/null &
