#!/bin/bash

hostnamectl set-hostname ${hostname}

yum update -y

yum install nginx -y

systemctl enable nginx

systemctl start nginx

echo "Welcome to ${environment}" >/usr/share/nginx/html/index.html