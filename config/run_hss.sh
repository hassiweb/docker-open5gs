#!/bin/sh

echo "Waiting for " ${MONGODB_STARTUP_TIME} "s for mongodb to be ready..."
sleep ${MONGODB_STARTUP_TIME}

echo "Launching HSS..."

touch /var/log/open5gs/hss.log

tail -f /var/log/open5gs/hss.log &

open5gs-hssd -c /etc/open5gs/hss.yaml
