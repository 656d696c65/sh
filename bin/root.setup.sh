#!/bin/sh


# Start scripts
sh /home/toor/.sh/bin/root.security.sh
sh /home/toor/.sh/bin/root.docker.sh

# Execute as toor user
sudo su -l toor -c `
    sh ~/.sh/bin/toor.docker.sh
    sh ~/.sh/bin/toor.traefik.sh
`

rm -r /home/toor/.sh
