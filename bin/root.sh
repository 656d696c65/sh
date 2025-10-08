#!/bin/sh


# Update packages
sudo apt update
sudo apt upgrade


# Set up new user toor
sudo adduser toor
sudo apt -y install sudo
sudo usermod -aG root,sudo,adm toor
sudo su - toor


# Install git and clone repo
sudo apt -y install git
sudo git clone --depth 1 https://github.com/emilesabatier/sh /home/toor/.sh


# Security
echo "\n\e[1;31m[Security]\e[0m"

# Set up iptables
sudo apt -y install iptables
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Set up fail2ban
sudo apt -y install fail2ban
sudo cp -v /home/toor/.sh/etc/fail2ban/jail.local /etc/fail2ban/jail.local
sudo systemctl restart fail2ban


# Docker
echo "\n\e[1;31m[Docker]\e[0m"


# Set up Docker's apt repository
sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install the Docker packages
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add Docker rights
sudo groupadd docker
sudo usermod -aG docker toor


# Execute as toor user
sudo su -l toor -c `sh /home/toor/.sh/bin/toor.setup.sh`

# # Remove repo
# rm -r /home/toor/.sh
