#!/bin/sh

printf "\n" "[Traefik]"

mkdir ~/traefik
cp ~/.sh/home/traefik/docker-compose.yml ~/traefik/docker-compose.yml
docker compose up -d
