#!/bin/sh

dockerun -v /home/ubuntu/Docker-nginx-cloudflare-ssl-proxy/certs:/etc/nginx/certs --name nginx-ssl -p 443:443 -p 80:80 --network nginx-net --rm -d nginx-cloudfare-ssl-proxy