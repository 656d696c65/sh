#!/bin/sh

printf "\n"
echo "\e[1;31m[Plausible]\e[0m"


# Add plausible compose file
git clone --depth 1 https://github.com/plausible/community-edition /home/toor/plausible
cp /home/toor/.sh/home/plausible/docker-compose.yml /home/toor/plausible/docker-compose.yml
cp /home/toor/.sh/home/plausible/plausible-conf.env /home/toor/plausible/plausible-conf.env
docker compose -f /home/toor/plausible/docker-compose.yml up -d
