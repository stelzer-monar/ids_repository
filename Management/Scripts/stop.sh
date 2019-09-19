#!/bin/bash

set -e

sudo systemctl stop suricata
sudo rm -rf /var/run/suricata.pid
