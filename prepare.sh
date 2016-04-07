cd tunasync
../utils/genpack.sh tunasync
cd ..

cd jekyll
../utils/genpack.sh mirror-web
docker build -t sjtug/mirror-jekyll-builder .
cd ..

# http://www.projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/
mkdir -p /home/mirror-web/_site
docker run \
    -v /home/mirror-web/_site:/opt/_site:Z \
    sjtug/mirror-jekyll-builder:latest \
    jekyll build -d /opt/_site
