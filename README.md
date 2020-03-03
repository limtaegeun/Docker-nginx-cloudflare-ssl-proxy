# Supported tags

- `latest`, `1.10.3-ubuntu`



# What is nginx-cloudflare-ssl-proxy

This docker image is an open source serve proxy wep application server (WAS) for HTTPS using clouldflare full SSL

This help to use Cloudflare full SSL with Nginx and proxy to port of web application server in Production environment 

It is licensed under MIT license and it made by havehad inc. and contributors

![havehad|100x100,20%](https://cdn.havehad.kr/image/logo/hhlogo.png)



# How to use this image

## Quick start

> Preparation
>
> - server domain managed by cloudflare DNS 
> - web application server like Node.js express server run by docker image



### 1. Create your origin certificate and private key

See here

https://kb.virtubox.net/knowledgebase/cloudflare-ssl-origin-certificates-nginx/

And save or copy .pem and .key files in your server 

>  Assume .pem and .key file name is cert.pem and cert.key

### 2. Create Docker network

```shell
$ docker network create nginx-net
```



### 3. Run web application server by docker image 

```shell
$ docker run -d -v config:/usr/src/app/config --name nodejs --network nginx-net your-was
```



### 4. Run nginx-cloudflare-ssl-proxy

```shell
$ docker run -v -d -v /some/certs:/etc/nginx/certs --name nginx-ssl -p 443:443 -p 80:80 --network nginx-net -e SERVER_NAME=your.domain.com imori333/nginx-cloudflare-ssl-proxy
```



## Using environment variables

- CONTAINER_NAME  : your app container name 
- SERVER_NAME : your domain name
- PEM_PATH : .pem file path 
- KEY_PATH : private key file path 



#### example 

when your certificate and private key name and path is different 

```shell
$ docker run -v -d -v /some/certs:/etc/nginx/other --name nginx-ssl \ 
-p 443:443 -p 80:80 --network nginx-net -e SERVER_NAME=your.domain.com\
-e PEM_PATH=/etc/nginx/other/mycert.pem \
-e KEY_PATH=/etc/nginx/other/mycert.key \
imori333/nginx-cloudflare-ssl-proxy
```



# License

[MIT license](https://opensource.org/licenses/MIT)

Copyright (c) 2020-present, limtaegeun

