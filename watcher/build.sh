rm -rf git-repo
git clone https://github.com/sjtug/nginx-simple-watcher.git git-repo

cd git-repo

docker run -v "$PWD":/usr/src/watcher -w /usr/src/watcher \
    sjtug/cpp-suite:2016-05-15 \
	g++ -g  -std=c++14 watcher.cpp -o watcher -pthread -static

cd ..
