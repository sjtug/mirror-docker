#!/bin/bash
echo "Starting nginx"
service nginx start
echo $?
echo "Starting jekyll"
echo $?
/usr/local/bin/jekyll serve -s /home/mirror-web -t /home/mirror-web/_site --watch &
echo "Starting tunasync"
python2 /home/tunasync/tunasync.py -c /home/tunasync/tunasync.conf
