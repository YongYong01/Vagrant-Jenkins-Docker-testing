FROM ubuntu:14.04

# root Password setzen
RUN echo 'mysql-server mysql-server/root_password password Server.22' | debconf-set-selections 
RUN echo 'mysql-server mysql-server/root_password_again password Server.22' | debconf-set-selections 

# Installation
RUN apt-get update && apt-get install -y mysql-server

# mysql config
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

EXPOSE 3306

VOLUME /var/lib/mysql

CMD ["mysqld"]
