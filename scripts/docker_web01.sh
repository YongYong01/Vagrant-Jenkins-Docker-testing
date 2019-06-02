#!/bin/bash

# Start Apache Container in the Background
cd /vagrant/apache
docker build -t apache .
sudo docker run --rm -d -p 8080:80 -v `pwd`/web:/var/www/html --name apache apache

# Start Jenkins Container in the Background
cd /vagrant/jenkins
docker build -t jenkins .
sudo docker run -d --name jenkins -p 8082:8080 --rm -v /var/run/docker.sock:/var/run/docker.sock -v /vagrant:/vagrant    jenkins

# Reverse Proxy einrichten
sudo apt-get install libxml2-dev

sudo a2enmod proxy
sudo a2enmod proxy_html
sudo a2enmod proxy_http 

sudo sed -i '1 i\ch-web01 localhost' /etc/apache2/apache2.conf

sudo service apache2 restart

sudo cp /vagrant/apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf

