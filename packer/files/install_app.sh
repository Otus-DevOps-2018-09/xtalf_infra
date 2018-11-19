#!/bin/bash

sudo git clone -b monolith https://github.com/express42/reddit.git /opt/reddit
sudo chown appuser:appuser -R /opt/reddit
cd /opt/reddit && bundle install

sudo wget -O /etc/systemd/system/puma.service https://gist.githubusercontent.com/xtalf/98fd92e62b5e51b50c7cd1c4a4605370/raw/a41a6c91afc06e6857853afd0c0c5d0f960e9fd3/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
