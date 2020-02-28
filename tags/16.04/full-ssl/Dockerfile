FROM ubuntu:16.04
MAINTAINER limtaegeun <imori333@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

ENV PROXY_PASS http://localhost:3000
ENV SERVER_NAME myserver.com
ENV PEM_PATH /etc/nginx/certs/cert.pem
ENV KEY_PATH /etc/nginx/certs/cert.key

WORKDIR /etc/nginx

RUN rm sites-enabled/default
ADD ./sites-available/ssl /etc/nginx/sites-available/ssl
RUN sed -ri 's@PROXY_PASS@'${PROXY_PASS}'@' /etc/nginx/sites-available/ssl
RUN sed -ri 's@SERVER_NAME@'${SERVER_NAME}'@' /etc/nginx/sites-available/ssl
RUN sed -ri 's@PEM_PATH@'${PEM_PATH}'@' /etc/nginx/sites-available/ssl
RUN sed -ri 's@KEY_PATH@'${KEY_PATH}'@' /etc/nginx/sites-available/ssl
RUN ls -al sites-enabled/default
RUN ln -s /etc/nginx/sites-available/ssl sites-enabled/default

EXPOSE 80 443

CMD ["nginx"]