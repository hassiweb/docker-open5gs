#!/bin/sh

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

rm hss/hss.log
rm mme/mme.log
rm pcrf/pcrf.log
rm pgw/pgw.log
rm sgw/sgw.log
