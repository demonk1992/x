#!/bin/bash
apt-get install cron -y
cd /usr/bin
wget https://raw.githubusercontent.com/demonk1992/x/main/autokill.sh && chmod +x autokill.sh
wget https://raw.githubusercontent.com/demonk1992/x/main/userlimit.sh && chmod +x userlimit.sh
wget https://raw.githubusercontent.com/demonk1992/x/main/userlimitssh.sh && chmod +x userlimitssh.sh
wget https://raw.githubusercontent.com/demonk1992/x/main/clearcache.sh && chmod +x clearcache.sh
cd /etc
rm crontab
wget https://raw.githubusercontent.com/demonk1992/x/main/crontab && chmod +x crontab
cd
echo "@reboot root userlimit.sh" > /etc/cron.d/userlimit1
echo "@reboot root userlimitssh.sh" > /etc/cron.d/userlimitssh1
echo "@reboot root clearcache.sh" > /etc/cron.d/clearcache1
sed -i '$ i\screen -dmS autokill ./autokill.sh' /etc/rc.local
history -c && history -w
