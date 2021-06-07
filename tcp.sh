#!/bin/bash
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
sysctl net.core.default_qdisc
sysctl -p
sed -i '$ i\fs.file-max = 1024000' /etc/sysctl.conf
sed -i '$ i\fs.inotify.max_user_instances = 8192' /etc/sysctl.conf
sed -i '$ i\net.core.default_qdisc=fq' /etc/sysctl.conf
sed -i '$ i\net.core.netdev_max_backlog = 262144' /etc/sysctl.conf
sed -i '$ i\net.core.rmem_default = 8388608' /etc/sysctl.conf
sed -i '$ i\net.core.rmem_max = 67108864' /etc/sysctl.conf
sed -i '$ i\net.core.somaxconn = 65535' /etc/sysctl.conf
sed -i '$ i\net.core.wmem_default = 8388608' /etc/sysctl.conf
sed -i '$ i\net.core.wmem_max = 67108864' /etc/sysctl.conf
sed -i '$ i\net.ipv4.ip_forward = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.ip_local_port_range = 10240 65000' /etc/sysctl.conf
sed -i '$ i\net.ipv4.route.gc_timeout = 100' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_congestion_control = hybla' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_fastopen = 3' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_fin_timeout = 30' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_keepalive_time = 1200' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_max_orphans = 3276800' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_max_syn_backlog = 65536' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_max_tw_buckets = 60000' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_mem = 94500000 915000000 927000000' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_mtu_probing = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_rmem = 4096 87380 67108864' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_sack = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_syn_retries = 2' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_synack_retries = 2' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_syncookies = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_low_latency = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_timestamps = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_tw_reuse = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_window_scaling = 1' /etc/sysctl.conf
sed -i '$ i\net.ipv4.tcp_wmem = 4096 65536 67108864' /etc/sysctl.conf
sed -i '$ i\net.netfilter.nf_conntrack_max = 6553500' /etc/sysctl.conf
sed -i '$ i\net.netfilter.nf_conntrack_tcp_timeout_close_wait = 60' /etc/sysctl.conf
sed -i '$ i\net.netfilter.nf_conntrack_tcp_timeout_established = 3600' /etc/sysctl.conf
sed -i '$ i\net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 120' /etc/sysctl.conf
sed -i '$ i\net.netfilter.nf_conntrack_tcp_timeout_time_wait = 120' /etc/sysctl.conf
sed -i '$ i\net.nf_conntrack_max = 6553500' /etc/sysctl.conf
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
lsmod | grep bbr
echo "session required pam_limits.so" >> /etc/pam.d/common-session
echo "* soft nproc 1000000" >> /etc/security/limits.conf
echo "* hard nproc 1000000" >> /etc/security/limits.conf
echo "* soft nofile 1000000" >> /etc/security/limits.conf
echo "* hard nofile 1000000" >> /etc/security/limits.conf
echo "root soft nproc 1000000" >> /etc/security/limits.conf
echo "root hard nproc 1000000" >> /etc/security/limits.conf
echo "root soft nofile 1000000" >> /etc/security/limits.conf
echo "root hard nofile 1000000" >> /etc/security/limits.conf
