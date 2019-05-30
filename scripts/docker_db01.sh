#!/bin/bash

# Start Apache Container in the Background
cd /vagrant/mysql
docker build -t mysql .
docker run --rm -d --name mysql mysql
