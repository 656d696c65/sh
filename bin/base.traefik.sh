#!/bin/sh

printf "\n \e[32;1m [Traefik] \e[0m"

mkdir ~/traefik
cp ~/.sh/home/traefik/docker-compose.yml ~/traefik/docker-compose.yml
docker compose up -d
