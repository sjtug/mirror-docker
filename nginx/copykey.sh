#!/bin/sh
site_="mirrors.sjtug.org"
if [ -f "$HOME/.acme.sh/$site_/fullchain.cer"]\
    && [ -f "$HOME/.acme.sh/$site_/$site_.key" ] ; then
    cp -u "$HOME/.acme.sh/$site_/fullchain.cer" cert.cer
    cp -u "$HOME/.acme.sh/$site_/$site_.key" key.key
else
    echo "=== WARNING ==="
    echo "SSL disabled. Only for local development."
    touch cert.cer
    touch key.key
    cp -f nginx_without_ssl.conf nginx.conf
fi

