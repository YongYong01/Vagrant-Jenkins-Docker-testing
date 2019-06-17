#!/bin/bash

# Start Apache Container in the Background
cd /vagrant/mysql
sudo docker build -t mysql .
sudo docker run --rm -d --name mysql mysql
