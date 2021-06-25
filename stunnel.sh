#!/bin/bash
wget ftp://ftp.stunnel.org/stunnel/archive/5.x/stunnel-5.59.tar.gz
tar -xf stunnel-5.59.tar.gz
cd stunnel-5.59
# Create group stunnel
groupadd -g 51 stunnel &&
useradd -c "stunnel Daemon" -d /var/lib/stunnel \
        -g stunnel -s /bin/false -u 51 stunnel
./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-systemd    &&
make
make docdir=/usr/share/doc/stunnel-5.59 install
install -v -m750 -o stunnel -g stunnel -d /var/lib/stunnel/run &&
chown stunnel:stunnel /var/lib/stunnel
cat > /etc/stunnel/stunnel.conf << "EOF" 
; File: /etc/stunnel/stunnel.conf

; Note: The pid and output locations are relative to the chroot location.

pid    = /run/stunnel.pid
chroot = /var/lib/stunnel
client = no
setuid = stunnel
setgid = stunnel
cert   = /etc/stunnel/stunnel.pem

;debug = 7
;output = stunnel.log

[https]
accept  = 3128
connect = 443
;; "TIMEOUTclose = 0" is a workaround for a design flaw in Microsoft SSL
;; Microsoft implementations do not use SSL close-notify alert and thus
;; they are vulnerable to truncation attacks
TIMEOUTclose = 0

EOF
# Import Certificate
cd /etc/stunnel
wget https://raw.githubusercontent.com/demonk1992/x/main/stunnel.pem
cd
cat > /etc/systemd/system/stunnel.service << "EOF"
[Unit]
Description=SSL tunnel for network daemons
Documentation=man:stunnel https://www.stunnel.org/docs.html
DefaultDependencies=no
After=network.target
After=syslog.target

[Install]
WantedBy=multi-user.target
Alias=stunnel.target

[Service]
Type=forking
EnvironmentFile=-/etc/sysconfig/stunnel.conf 
ExecStart=/usr/bin/stunnel /etc/stunnel/stunnel.conf
LimitNOFILE=infinity
EOF

systemctl daemon-reload && systemctl enable stunnel && systemctl restart stunnel