#!/bin/sh

docker run -d -v certs:/etc/nginx/certs --name nginx-ssl -p 80:80 --rm ngins-cloudfare-ssl-proxy
