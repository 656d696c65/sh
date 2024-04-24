#!/bin/sh

# printf "\n"
# echo "\e[1;31m[Traefik]\e[0m"


# Add traefik compose file
mkdir /home/toor/traefik
cp /home/toor/.sh/home/traefik/docker-compose.yml /home/toor/traefik/docker-compose.yml
docker compose -f /home/toor/traefik/docker-compose.yml up -d
