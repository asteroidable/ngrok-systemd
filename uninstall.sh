#!/usr/bin/env bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

## stop service
systemctl stop ngrok.service
systemctl disable ngrok.service

## remove service
rm /lib/systemd/system/ngrok.service

## remove configuration
rm -rf /etc/ngrok

## remove logdir
rm -rf /var/log/ngrok

## remove binary
rm -rf /usr/local/bin/ngrok

