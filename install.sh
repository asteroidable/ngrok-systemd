#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

if [ -z "$1" ]; then
    echo "./install.sh <your_authtoken>"
    exit 1
fi

## prepare
mkdir -p /tmp/ngrok-systemd-install
cd /tmp/ngrok-systemd-install
git clone https://github.com/vincenthsu/systemd-ngrok.git .

## install binary
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
cp ngrok /usr/local/bin/

## install configuration
mkdir -p /etc/ngrok
cp ngrok.yml /etc/ngrok/
sed -i "s/<add_your_token_here>/$1/g" /etc/ngrok/ngrok.yml

## prepare logdir
mkdir -p /var/log/ngrok

## install service
cp ngrok.service /lib/systemd/system/

## start service
systemctl enable ngrok.service
systemctl start ngrok.service

