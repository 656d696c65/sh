#!/bin/sh

printf "\n"
echo $"\e[1;31m[Coulba]\e[0m"


# Add coulba compose file
mkdir /home/toor/coulba
cp /home/toor/.sh/home/coulba/compose.yaml /home/toor/coulba/compose.yaml
docker compose -f /home/toor/coulba/compose.yaml up -d
