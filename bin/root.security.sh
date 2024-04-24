#!/bin/sh

printf "\n"
printf "\e[1;31m[Security]\e[0m"


# Set up iptables
apt -y install iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Set up fail2ban
apt -y install fail2ban
cp -v /home/toor/.sh/etc/fail2ban/jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
