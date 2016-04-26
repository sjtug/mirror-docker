#!/bin/sh
site_="mirrors.sjtug.org"
copy -u "$HOME/.acme.sh/$site_/fullchain.cer" cert.cer
copy -u "$HOME/.acme.sh/$site_/$site_.key" key.key

