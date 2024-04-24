#!/bin/sh


# Install git
apt update
apt -y install git

# Pull repo
git clone --depth 1 https://github.com/emilesabatier/sh /root/.sh

# Start scripts
sh /root/.sh/bin/root.security.sh
sh /root/.sh/bin/root.docker.sh

# Execute as toor user
sudo su -l toor -c `
    sh /root/.sh/bin/toor.setup.sh
`
