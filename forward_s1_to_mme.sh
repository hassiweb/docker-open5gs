#!/bin/bash

set -ex

COMMAND="${@:-usage}"

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

usage () {
  echo "Usage: sudo sh forward_sctp_to_mme.sh {start|stop}"
}

start () {
  /sbin/iptables -I DOCKER-USER -p sctp -s 0.0.0.0/0  -d 192.168.26.20 --dport 36412 -j ACCEPT
  /sbin/iptables -t nat -A DOCKER -p sctp -m sctp --dport 36412 -j DNAT --to-destination 192.168.26.20:36412
  /sbin/iptables -t nat -A POSTROUTING -p sctp -m sctp --dport 36412 -s 192.168.26.20 -d 192.168.26.20 -j MASQUERADE
}

stop () {
  /sbin/iptables -D DOCKER-USER -p sctp -s 0.0.0.0/0  -d 192.168.26.20 --dport 36412 -j ACCEPT
  /sbin/iptables -t nat -D DOCKER -p sctp -m sctp --dport 36412 -j DNAT --to-destination 192.168.26.20:36412
  /sbin/iptables -t nat -D POSTROUTING -p sctp -m sctp --dport 36412 -s 192.168.26.20 -d 192.168.26.20 -j MASQUERADE
}

$COMMAND
