FROM ubuntu:xenial
MAINTAINER VicLuo

COPY apt_sources.list /etc/apt/sources.list

RUN apt-get update && apt-get -y install \
	python \
	python-toml \
	python-sh \
	python-setproctitle \
	rsync

# install tunasync
ADD tunasync.tar.gz /home/tunasync
COPY tunasync.conf /home/tunasync/

CMD ["python2", "/home/tunasync/tunasync.py", "-c", "/home/tunasync/tunasync.conf"]
