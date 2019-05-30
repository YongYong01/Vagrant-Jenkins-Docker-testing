Vagrant.configure("2") do |config|
	# Jenkins and Apache Virtual Machine
	config.vm.define "web01" do |web01|
		web01.vm.box = "ubuntu/xenial64"
		
		# Portforwarding, Jenkins 8082, http 80, sql 3306
		web01.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
		web01.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
		web01.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
		web01.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true  
		
		# Enabling a forwarded Portrange for Jenkins
		for i in 32760..32780
				web01.vm.network :forwarded_port, guest: i, host: i
		end	
		
		# Docker Provisioner (Install image)
		web01.vm.provision "docker" do |d|
			d.pull_images "ubuntu:14.04"
		end	

		# Hostname
		web01.vm.hostname = "ch-web01"

		# Vagrant Name
		web01.vm.provider "virtualbox" do |v|
			v.name = "ch-web01"
		end

		#Shell Script Part Updating APT Repository and create Synch Folder
		web01.vm.provision :shell, inline: <<-SHELL
			sudo apt-get update
			sudo apt-get -y install apache2
			mkdir /etc/shared
			sh /vagrant/scripts/ufw.sh
			sh /vagrant/scripts/docker.sh
		SHELL
		web01.vm.synced_folder "./shared_web01", "/etc/shared"
		
		# Firewall Configurations
		web01.vm.provision "shell", path: "scripts/ufw.sh"

		# Docker Configurations
		web01.vm.provision "shell", path: "scripts/docker.sh"
	end

	# MySQL Virtual Machine
	config.vm.define "db01" do |db01|
		db01.vm.box = "ubuntu/xenial64"
		
		# Portforwarding, Jenkins 8082, http 80, sql 3306
		db01.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
		db01.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
		db01.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
		db01.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true  
		
		# Enabling a forwarded Portrange for Jenkins
		for i in 32760..32780
				db01.vm.network :forwarded_port, guest: i, host: i
		end	
		
		db01.vm.provision :shell, inline: <<-SHELL
			sudo apt-get update
			sudo apt-get -y install debconf-utils 
			sudo apt-get -y install apache2 
			sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
			sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'
			sudo apt-get -y install php libapache2-mod-php php-curl php-cli php-mysql php-gd mysql-client mysql-server 
			sudo service apache2 restart 
		SHELL
		db01.vm.synced_folder "./shared_db01", "/etc/shared"

		# Docker Provisioner (Install image)
		db01.vm.provision "docker" do |d|
			d.pull_images "ubuntu:14.04"
		end

		# Hostname
		db01.vm.hostname = "ch-db01"

		# Virtualbox Name
		db01.vm.provider "virtualbox" do |v|
			v.name = "ch-db01"
		end	
	end
end

