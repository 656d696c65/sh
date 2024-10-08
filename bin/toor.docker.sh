#!/bin/sh

printf "\n"
echo $"\e[1;31m[Docker]\e[0m"


# Init Docker swarm
# docker swarm init

# Add Docker networks
docker network create traefik-public
docker network create internal
