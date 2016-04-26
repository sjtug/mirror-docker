#!/bin/sh
site_=${1-mirrors.sjtug.org}
path_=${2-/home/mirror-web/site_}

echo "Site: $site_ "
echo "Path: $path_ "
echo "Installing acme.sh"
curl https://get.acme.sh | sh
echo "Issuing cert for $site_ under $path_"
acme.sh --issue -d "$site_" -w "$path_"
