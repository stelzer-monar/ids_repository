#!/bin/bash

set -e

#IFACE=`ip route get 8.8.8.8 | awk '{ print $5; exit}'`
#sudo /usr/bin/suricata -c /etc/suricata/suricata.yaml -i $IFACE

sudo service suricata start
