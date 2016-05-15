#!/bin/sh
site_="mirrors.sjtug.org"
cp -u "$HOME/.acme.sh/$site_/fullchain.cer" cert.cer
cp -u "$HOME/.acme.sh/$site_/$site_.key" key.key

