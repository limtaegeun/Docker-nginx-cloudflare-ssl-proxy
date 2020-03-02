#!/bin/sh

rm -f /etc/nginx/sites-enabled/default
sed -ri 's@CONTAINER_NAME@'$1'@' /etc/nginx/sites-available/ssl
sed -ri 's@SERVER_NAME@'$2'@' /etc/nginx/sites-available/ssl
sed -ri 's@PEM_PATH@'$3'@' /etc/nginx/sites-available/ssl
sed -ri 's@KEY_PATH@'$4'@' /etc/nginx/sites-available/ssl
# cp -f sites-available/ssl sites-available/default
ln -s /etc/nginx/sites-available/ssl /etc/nginx/sites-enabled/default