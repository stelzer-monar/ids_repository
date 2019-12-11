#!/bin/bash

set -e

sudo service suricata stop

# removes locks from previous instances
sudo rm -rf /var/run/suricata*.pid
