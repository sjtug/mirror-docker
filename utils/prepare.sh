#!/bin/sh
echo "Issuing Cert with acme.sh"
source acquire_cert.sh

echo "Building TunaSync"
cd tunasync
bash build.sh
cd ..

echo "Building Nginx"
cd nginx
bash build.sh
cd ..

echo "Building Jekyll"
cd jekyll
bash build.sh
cd ..

