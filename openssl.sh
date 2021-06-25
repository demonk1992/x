#!/bin/bash
cd /usr/local/src/
wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz && tar -xvf openssl-1.1.1k.tar.gz && cd openssl-1.1.1k
sudo ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
make && make test && make install
cd /etc/ld.so.conf.d/
cat > openssl-1.1.1k.conf << "EOF"
/usr/local/ssl/lib
EOF
sudo ldconfig -v
sudo mv /usr/bin/c_rehash /usr/bin/c_rehash.backup
sudo mv /usr/bin/openssl /usr/bin/openssl.backup
cat > /etc/environment << "EOF"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/ssl/bin"
EOF
source /etc/environment
echo $PATH
which openssl
openssl version -a
apt-get purge openssl -y
apt-get install -y ca-certificates apt-transport-https
apt-get install -y openssl
