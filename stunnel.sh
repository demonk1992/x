apt-get -y install stunnel4
cat > /etc/stunnel/stunnel.conf << "EOF"
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[https]
connect = 127.0.0.1:443
accept = 3128
EOF
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
# Generate Certificate
openssl req -new -newkey rsa:2048 -days 3650 \
  -nodes -x509 -sha256 \
  -subj '/CN=LocalHost' \
  -keyout /etc/stunnel/stunnel.pem \
  -out /etc/stunnel/stunnel.pem
service stunnel4 restart
