#!/bin/sh


echo "Launching SGW..."

touch /var/log/open5gs/sgw.log

tail -f /var/log/open5gs/sgw.log &

open5gs-sgwd -c /etc/open5gs/sgw.yaml
