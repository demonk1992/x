apt-get install -y dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=222/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS=""/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=""/DROPBEAR_EXTRA_ARGS="/etc/idssh.net/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart
# Upgrade Dropbear
wget https://matt.ucc.asn.au/dropbear/releases/dropbear-2016.74.tar.bz2
bzip2 -cd dropbear-2016.74.tar.bz2 | tar xvf -
cd dropbear-2016.74
./configure
make && make install
mv /usr/sbin/dropbear /usr/sbin/dropbear.old
ln /usr/local/sbin/dropbear /usr/sbin/dropbear
cd && rm -rf dropbear-2016.74 && rm -rf dropbear-2016.74.tar.bz2
DROPBEAR=/etc/defaualt/dropbear
sed -i "s/DROPBEAR_EXTRA_ARGS=""/DROPBEAR_EXTRA_ARGS=""/g" "$DROPBEAR"
sed -i "s/DROPBEAR_EXTRA_ARGS=""/DROPBEAR_EXTRA_ARGS="/etc/idssh.net"/g"
service dropbear restart
