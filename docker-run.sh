#!/bin/sh

docker run -d -v /home/ubuntu/Docker-nginx-cloudflare-ssl-proxy/certs:/etc/nginx/certs -e SERVER_NAME=docker.havehad.kr --name nginx-ssl -p 443:443 --rm nginx-cloudfare-ssl-proxy