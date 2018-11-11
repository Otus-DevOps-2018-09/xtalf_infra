#!/bin/bash

sudo git clone -b monolith https://github.com/express42/reddit.git /opt/reddit
sudo chown appuser:appuser -R /opt/reddit
cd /opt/reddit && bundle install

sudo wget -O /etc/systemd/system/puma.service https://gist.githubusercontent.com/xtalf/98fd92e62b5e51b50c7cd1c4a4605370/raw/caf56f108f1392c474ec7d224911a2763368421a/puma.service
sudo systemctl daemon-reload
sudo systemctl enable puma.service
