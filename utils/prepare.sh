#!/bin/sh

ROOT=`dirname $(pwd)/"$0"`
cd $ROOT
while true; do
    ROOT=`pwd`
    if [ $ROOT = '/' ]; then echo "Failed to find right path!"; exit 1; fi
    if [ -f LICENSE ] && [ -d utils ] ; then
        echo "Found path $ROOT"
        break
    fi
    cd ..
done
cd $ROOT
ls

echo "Issuing Cert with acme.sh"
source ./acquire_cert.sh

echo "Building TunaSync"
cd tunasync
bash ./build.sh
cd ..

echo "Building Nginx"
cd nginx
bash ./build.sh
cd ..

echo "Building Jekyll"
cd jekyll
bash ./build.sh
cd ..

