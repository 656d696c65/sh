#!/bin/sh

printf "\n[Traefik]"

mkdir /home/656d696c65/traefik
cp ../home/656d696c65/traefik/docker-compose.yml /home/656d696c65/traefik/docker-compose.yml
docker compose up -d
