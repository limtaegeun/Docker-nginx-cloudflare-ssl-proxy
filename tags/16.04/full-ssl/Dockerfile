FROM ubuntu:16.04
MAINTAINER limtaegeun <imori333@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

ENV PROXY_PASS
WORKDIR /etc/nginx

#ADD ./config/default /etc/nginx/sites-available


EXPOSE 80 443

CMD ["nginx"]