HOST_REPO="/home/mirrors"
HOST_WEB_PAGES="/home/mirror-web"

#Hard-coded in ngnix.conf
CONTAINER_REPO="/mnt/mirrors"
CONTAINER_WEB_PAGES="/mnt/mirror-web"

#mirrors_tunasync
docker run -d\
    -v $HOST_REPO:$CONTAINER_REPO:Z \
    -v $HOST_WEB_PAGES:$CONTAINER_WEB_PAGES:Z \
    sjtug/mirror-tunasync

#mirrors_nginx
docker run -d -p 80:80 \
    -v $HOST_REPO:$CONTAINER_REPO:Z \
    -v $HOST_WEB_PAGES:$CONTAINER_WEB_PAGES:Z \
    sjtug/mirror-nginx
