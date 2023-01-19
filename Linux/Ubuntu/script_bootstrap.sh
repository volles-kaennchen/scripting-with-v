#!/bin/bash

# apt im Noninteractive-Modus
export DEBIAN_FRONTEND=noninteractive

# allgemeine Updates
apt-get update
apt-get -y upgrade

# Konfiguration der Namensauflösung
systemctl disable --now systemd-resolved
rm /etc/resolv.conf
echo "nameserver 10.XX.XX.10" > /etc/resolv.conf
echo "nameserver 10.XX.XX.11" >> /etc/resolv.conf
echo "search kurs.test" >> /etc/resolv.conf
echo "XXX.168.1.XX gitlab.kurs.test gitlab" >> /etc/hosts
apt-get -y install dnsmasq

# Installation der aktuellen Docker-CE
apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
systemctl enable docker

# Docker-Rechte für Vagrant
usermod -aG docker vagrant

mkdir -p /srv/gitlab/{config,logs,data}
cp /vagrant/config/certs/* /srv/gitlab/config

