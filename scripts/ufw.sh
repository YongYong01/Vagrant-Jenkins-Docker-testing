#!/bin/sh

# Enable Firewall
sudo ufw enable

# Allow a range of Firewall rules for Jenkins
for i in 32760..32780
	sudo ufw allow i
end

# SSH
sudo ufw allow 22

# HTTP
sudo ufw allow 80

# HTTPS
sudo ufw allow 443

# Jenkins
sudo ufw allow 8080
sudo ufw allow 8082

# MySQL
sudo ufw allow 3306

