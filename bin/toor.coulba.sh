#!/bin/sh

printf "\n"
echo $"\e[1;31m[Coulba]\e[0m"


# Add coulba compose file
mkdir /home/toor/coulba
cp /home/toor/.sh/home/coulba/docker-compose.yml /home/toor/coulba/docker-compose.yml
docker compose -f /home/toor/coulba/docker-compose.yml up -d
