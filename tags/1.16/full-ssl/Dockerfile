FROM ubuntu:16.04
MAINTAINER limtaegeun <imori333@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx
#ADD ./config/default /etc/nginx/sites-available

EXPOSE 80 443

CMD service nginx start