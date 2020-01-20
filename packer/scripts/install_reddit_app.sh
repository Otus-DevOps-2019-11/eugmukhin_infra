#!/bin/bash
set -e

cd /home/appuser && git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install

cp /home/appuser/puma.service /etc/systemd/system/puma.service

systemctl daemon-reload
systemctl enable puma
