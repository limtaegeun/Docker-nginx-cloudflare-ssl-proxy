#!/bin/sh

rm -f /etc/nginx/sites-enabled/default
sed -ri 's@PROXY_PASS@'${PROXY_PASS}'@' /etc/nginx/sites-available/ssl
sed -ri 's@SERVER_NAME@'${SERVER_NAME}'@' /etc/nginx/sites-available/ssl
sed -ri 's@PEM_PATH@'${PEM_PATH}'@' /etc/nginx/sites-available/ssl
sed -ri 's@KEY_PATH@'${KEY_PATH}'@' /etc/nginx/sites-available/ssl
# cp -f sites-available/ssl sites-available/default
ln -s /etc/nginx/sites-available/ssl /etc/nginx/sites-enabled/default

exec "$@"
