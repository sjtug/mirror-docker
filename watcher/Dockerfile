FROM sjtug/jekyll-base:2016-04-07

MAINTAINER VicLuo

VOLUME ["/home/mirror-web"]

WORKDIR /home/mirror-web

RUN bundle install

# WTF
# This is a terrible workaround for
#   Conversion error: Jekyll::Converters::Babel encountered an error while converting 'static/js/index.es6':
#   "\xEF" on US-ASCII
# It seems that encoding.rb mishandles babel.js's leading <EF>, which is a utf-8 zero-width whitespace
RUN sed -i "s/^[ \t]*string.encode('UTF-8')/return string/g" /usr/lib/ruby/vendor_ruby/execjs/encoding.rb
