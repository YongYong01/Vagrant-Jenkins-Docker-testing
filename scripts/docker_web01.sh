#!/bin/bash

# Start Apache Container in the Background
cd /vagrant/apache
docker build -t apache .
sudo docker run --rm -d -p 8080:80 -v `pwd`/web:/var/www/html --name apache apache

# Start Jenkins Container in the Background
cd /vagrant/jenkins
docker build -t jenkins .
sudo docker run -d --name jenkins -p 8082:8080 --rm -v /var/run/docker.sock:/var/run/docker.sock -v /vagrant:/vagrant    jenkins
