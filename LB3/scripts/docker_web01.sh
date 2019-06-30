#!/bin/bash
#start Apache Container in the Background
cd /vagrant/apache
docker build -t apache .
sudo docker run --rm -d -p 8080:80 -v `pwd`/web:/var/www/html --name apache apache
