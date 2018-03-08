#!/usr/bin/bash

set -e

LATEST_URL=$(curl https://api.github.com/repos/sjtug/sjtug-mirror-frontend/releases/latest | jq '.assets[0].browser_download_url' -r)
wget -N -O /tmp/dists.zip "$LATEST_URL"
unzip -o -d . /tmp/dists.zip 
