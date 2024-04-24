#!/bin/sh

printf "\n"
printf "\e[1;31m[Docker]\e[0m"


# Add Docker networks
docker network create web
docker network create internal
