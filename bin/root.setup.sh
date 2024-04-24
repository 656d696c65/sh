#!/bin/sh


# Update packages
apt update
apt upgrade

# Set up new user
adduser -m --force-badname toor
apt -y install sudo
usermod -aG root,sudo,adm toor
cp -fv /home/toor/.sh/etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl restart sshd

# Install git
apt -y install git

# Pull repo
git clone --depth 1 https://github.com/emilesabatier/sh /home/toor/.sh

# Start scripts
sh /home/toor/.sh/bin/root.security.sh
sh /home/toor/.sh/bin/root.docker.sh

# Execute as toor user
sudo su -l toor -c `
    sh /home/toor/.sh/bin/toor.docker.sh
    sh /home/toor/.sh/bin/toor.traefik.sh
`

rm -r /home/toor/.sh
