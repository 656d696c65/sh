#!/bin/sh

printf "\n" "[Docker]"

printf "\t" "Set up Docker's apt repository"
apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update

printf "\t" "Install the Docker packages"
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

printf "\t" "Add Docker rights"
groupadd docker
usermod -aG docker 656d696c65

printf "\t" "Add Docker networks"
docker network create web
docker network create internal
