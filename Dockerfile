############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER VicLuo

# Add USTC Repo
RUN rm /etc/apt/sources.list
ADD ustc_source.list /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx

# Install zlib(required by jekyll)
RUN apt-get install -y zlib1g-dev

# Install Jekyll
RUN apt-get install -y jekyll bundler

# Install git
RUN apt-get install -y git

# Install python
RUN apt-get install -y python
RUN apt-get install -y python-toml python-sh python-setproctitle

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directoryremove
ADD nginx.conf /etc/nginx/

#Set up the web page
RUN git clone https://github.com/sjtug/mirror-web.git /home/mirror-web

WORKDIR /home/mirror-web

RUN bundle install

# WTF
# This is a terrible workaround for
#   Conversion error: Jekyll::Converters::Babel encountered an error while converting 'static/js/index.es6':
#   "\xEF" on US-ASCII
# It seems that encoding.rb mishandles babel.js's leading <EF>, which is a utf-8 zero-width whitespace
RUN sed -i "s/^[ \t]*string.encode('UTF-8')/return string/g" /usr/lib/ruby/vendor_ruby/execjs/encoding.rb

RUN apt-get upgrade -y

RUN jekyll build -s /home/mirror-web -d /home/mirror-web/_site

RUN mkdir -p /run/tunasync

RUN mkdir -p /var/log/tunasync

#install tunasync
RUN git clone https://github.com/sjtug/tunasync.git /home/tunasync
ADD tunasync.conf /home/tunasync/

ADD manage.sh /home/
RUN chmod +x /home/manage.sh

# Expose ports
EXPOSE 80:80

# Set the default command to execute
# when creating a new container
CMD ["bash /home/manage.sh"]


