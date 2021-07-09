#!/bin/bash
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.979_all.deb
dpkg -i webmin_1.979_all.deb
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python unzip