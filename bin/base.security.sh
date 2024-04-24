#!/bin/sh

printf "\n" "[Security]"

printf "\t" "Update packages"
apt update
apt upgrade

printf "\t" "Set up new user"
adduser --force-badname 656d696c65
apt install sudo
usermod -aG root,sudo,adm 656d696c65
cp -fv ~/.sh/etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

printf "\t" "Set up iptables"
apt install iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

printf "\t" "Set up fail2ban"
apt install fail2ban
cp -v ~/.sh/etc/fail2ban/jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
