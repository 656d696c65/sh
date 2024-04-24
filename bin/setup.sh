#!/bin/sh

apt update
apt install git

git clone --depth 1 https://github.com/emilesabatier/sh /root/.sh

sh /root/.sh/bin/base.sh
