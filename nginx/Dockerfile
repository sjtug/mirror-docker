FROM ubuntu:xenial
MAINTAINER VicLuo

COPY apt_sources.list /etc/apt/sources.list

RUN apt-get update && apt-get -y install \
	nginx

COPY nginx.conf /etc/nginx/

COPY key.key /etc/nginx/ssl/
COPY cert.cer /etc/nginx/ssl/

CMD ["nginx"]
