#!/bin/bash
for i in backup database
do
	sudo useradd -m -p $(openssl passwd -1 Server.22) $i
	sudo usermod -aG sudo $i
done


