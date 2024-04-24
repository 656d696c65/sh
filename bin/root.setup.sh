#!/bin/sh

apt update
apt -y install git

git clone --depth 1 https://github.com/emilesabatier/sh /root/.sh

sh /root/.sh/bin/root.security.sh
sh /root/.sh/bin/root.docker.sh

sudo su - toor
