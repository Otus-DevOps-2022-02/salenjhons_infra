#!/bin/bash

sudo apt update
sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
chown -R puma:puma reddit
cp /tmp/puma.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now puma.service
