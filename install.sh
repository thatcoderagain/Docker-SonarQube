#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

cp sonar.service /etc/systemd/system/.
mkdir /opt/sonar
cp docker-compose.yaml /opt/sonar
systemctl daemon-reload
systemctl enable sonar
systemctl start sonar
systemctl status sonar