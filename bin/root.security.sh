#!/bin/sh

printf "\n"
printf "\e[1;31m[Security]\e[0m"


# Update packages
apt update
apt upgrade

# Set up new user
adduser --force-badname toor
apt -y install sudo
usermod -aG root,sudo,adm toor
cp -fv /home/toor/.sh/etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

# Install git
apt -y install git

# Pull repo
git clone --depth 1 https://github.com/emilesabatier/sh /home/toor/.sh


# Set up iptables
apt -y install iptables
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Set up fail2ban
apt -y install fail2ban
cp -v /home/toor/.sh/etc/fail2ban/jail.local /etc/fail2ban/jail.local
systemctl restart fail2ban
