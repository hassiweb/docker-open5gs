#!/bin/sh


echo "Launching MME..."

touch /var/log/open5gs/mme.log

tail -f /var/log/open5gs/mme.log &

open5gs-mmed -c /etc/open5gs/mme.yaml
