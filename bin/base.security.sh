#!/bin/sh

printf "\n[Security]"

printf "\tUpdate packages"
apt update
apt upgrade

printf "\tSet up new user"
adduser 656d696c65
apt install sudo
usermod -aG root,sudo,adm 656d696c65
cp -f ../etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

printf "\tSet up iptables"
apt install iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

printf "\tSet up fail2ban"
apt install fail2ban
cp ../etc/fail2ban/jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
