#!/bin/bash
apt-get install -y linux-image-5.10.0-0.bpo.4-amd64 
cat > /etc/default/grub << "EOF" 
GRUB_DEFAULT="gnulinux-advanced-ece608be-d123-4838-8ffb-ddd0a9d4bfd5>gnulinux-5.10.0-0.bpo.4-amd64-advanced-ece608be-d123-4838-8ffb-ddd0a9d4bfd5"
GRUB_HIDDEN_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="console=tty1 console=ttyS0"
GRUB_CMDLINE_LINUX=""
EOF
sudo update-grub
