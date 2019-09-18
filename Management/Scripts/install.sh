#!/usr/bin/env bash
set -e
echo "Installing Suricata..."

sudo apt-get -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config libnetfilter-queue-dev libnetfilter-queue1 libnfnetlink-dev libnfnetlink0

VER=3.1
wget "http://www.openinfosecfoundation.org/download/suricata-$VER.tar.gz"
tar -xvzf "suricata-$VER.tar.gz"
cd "suricata-$VER"

./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var && make && make install-full

