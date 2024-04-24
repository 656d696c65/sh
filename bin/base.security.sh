#!/bin/sh

printf "\n \e[32;1m [Security] \e[0m"

# Update packages
apt update
apt upgrade

# Set up new user
adduser --force-badname 656d696c65
apt install sudo
usermod -aG root,sudo,adm 656d696c65
cp -fv ~/.sh/etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

# Set up iptables
apt install iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Set up fail2ban
apt install fail2ban
cp -v ~/.sh/etc/fail2ban/jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
