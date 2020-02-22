#!/bin/sh

ip tuntap add name ogstun mode tun
sysctl -w net.ipv6.conf.ogstun.disable_ipv6=0
ip addr add 45.45.0.1/16 dev ogstun
ip addr add cafe::1/16 dev ogstun
ip link set ogstun up

# masquerade
sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I INPUT -i ogstun -j ACCEPT

#/open5gs/open5gs-epcd -f /config/open5gs.conf

touch /var/log/open5gs/pgw.log

tail -f /var/log/open5gs/pgw.log &

open5gs-pgwd -c /etc/open5gs/pgw.yaml
