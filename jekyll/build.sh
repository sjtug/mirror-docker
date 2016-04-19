../utils/genpack.sh mirror-web
docker build -t sjtug/mirror-jekyll-builder:latest -t sjtug/mirror-jekyll-builder:`date -Idate` .

# http://www.projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/
mkdir -p /home/mirror-web/_site
docker run \
    -v /home/mirror-web/_site:/opt/_site:Z \
    -v $PWD/mirror-web:/home/mirror-web:Z \
    sjtug/mirror-jekyll-builder:latest \
    jekyll build -d /opt/_site

