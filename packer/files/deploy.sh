#!/bin/bash
sudo apt-get update
while pgrep -a apt-get; do echo 'Waiting for apt-get...'; sleep 1; done
sudo apt-get install -y git
cd
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
