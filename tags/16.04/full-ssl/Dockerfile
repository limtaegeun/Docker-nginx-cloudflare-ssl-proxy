FROM ubuntu:16.04
MAINTAINER limtaegeun <imori333@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

ENV CONTAINER_NAME nodejs
ENV SERVER_NAME myserver.com
ENV PEM_PATH /etc/nginx/certs/cert.pem
ENV KEY_PATH /etc/nginx/certs/cert.key

WORKDIR /etc/nginx

ADD ./sites-available/ssl /etc/nginx/sites-available/ssl
ADD ./docker-entrypoint.sh /etc/nginx/docker-entrypoint.sh
RUN chmod 777 /etc/nginx/docker-entrypoint.sh
EXPOSE 80 443
ENTRYPOINT ./docker-entrypoint.sh ${CONTAINER_NAME} ${SERVER_NAME} ${PEM_PATH} ${KEY_PATH}
CMD ["nginx"]