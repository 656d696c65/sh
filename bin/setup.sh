#!/bin/sh

apt update
apt install git

git clone --depth 1 https://github.com/emilesabatier/sh ~/.sh

sh ~/.sh/bin/base.sh
