#!/bin/bash

set -e

sudo systemctl stop suricata

# removes locks from previous instances
sudo rm -rf /var/run/suricata*.pid
