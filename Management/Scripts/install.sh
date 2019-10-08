#!/usr/bin/env bash
set -e
echo "Installing Suricata..."

sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libnss3-dev libgeoip-dev liblua5.1-dev libhiredis-dev libevent-dev python-yaml rustc cargo libnetfilter-queue-dev libnetfilter-queue1 libnetfilter-log-dev libnetfilter-log1 libnfnetlink-dev libnfnetlink0



#VER=4.1.2
#wget "http://www.openinfosecfoundation.org/download/suricata-$VER.tar.gz"
#tar -xvzf "suricata-$VER.tar.gz"
#cd "suricata-$VER"

#./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make install-full

sudo add-apt-repository -y ppa:oisf/suricata-stable
sudo apt update
sudo apt -y install suricata jq

IFACE=`ip route get 8.8.8.8 | awk '{ print $5; exit}'`

sudo sed -i "/^af-packet:/,/^$/ { s/interface:.*$/interface: $IFACE/ }" /etc/suricata/suricata.yaml

sudo suricata-update

sudo systemctl stop suricata

# removes locks from previous instances
sudo rm -rf /var/run/suricata*.pid

sudo systemctl start suricata

