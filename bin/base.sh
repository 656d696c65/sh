#!/bin/sh

sh /root/.sh/bin/base.security.sh
sh /root/.sh/bin/base.docker.sh


# Switch user
su - 656d696c65

sh /root/.sh/bin/base.traefik.sh
