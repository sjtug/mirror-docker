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

HOST_REPO="/home/mirrors"
HOST_WEB_PAGES="/home/mirror-web"
HOST_LOG="/home/logs"

#Hard-coded in ngnix.conf
CONTAINER_REPO="/mnt/mirrors"
CONTAINER_WEB_PAGES="/mnt/mirror-web"
CONTAINER_LOG="/var/log/nginx"
CONTAINER_WATCHER_WORKDIR="/usr/src/watcher"

#mirrors_tunasync
docker run -d\
    -v $HOST_REPO:$CONTAINER_REPO:Z \
    -v $HOST_WEB_PAGES:$CONTAINER_WEB_PAGES:Z \
    sjtug/mirror-tunasync

#mirrors_nginx
docker run -d -p 80:80 \
    -v $HOST_REPO:$CONTAINER_REPO:Z \
    -v $HOST_WEB_PAGES:$CONTAINER_WEB_PAGES:Z \
    -v $HOST_LOG:$CONTAINER_LOG:Z\
    sjtug/mirror-nginx

# Dirty hack
cp $(pwd)/watcher/git-repo/* $HOST_WEB_PAGES/_site
docker run -d \
    -v $(pwd)/watcher/git-repo:$CONTAINER_WATCHER_WORKDIR:Z\
    -w $CONTAINER_WATCHER_WORKDIR\
    -v $HOST_WEB_PAGES:$CONTAINER_WEB_PAGES:Z \
    -v $HOST_LOG:$CONTAINER_LOG:Z\
    sjtug/cpp-suite\
    ./watcher $HOST_LOG/access.log 30 $CONTAINER_WEB_PAGES/_site/test.json

