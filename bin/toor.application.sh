#!/bin/sh

printf "\n"
echo $"\e[1;31m[Application]\e[0m"


# Add coulba compose file
mkdir /home/toor/application
cp /home/toor/.sh/home/application/compose.yaml /home/toor/application/compose.yaml
docker compose -f /home/toor/application/compose.yaml up -d
