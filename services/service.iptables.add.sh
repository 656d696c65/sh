#!/bin/sh

read PORT
iptables -A INPUT -p tcp --dport $PORT -j ACCEPT
