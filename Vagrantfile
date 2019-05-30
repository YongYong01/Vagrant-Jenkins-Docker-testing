Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/xenial64"
	
	# Portforwarding, Jenkins 8082, http 80, sql 3306
	config.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
  	config.vm.network "forwarded_port", guest:8081, host:8081, auto_correct: true
  	config.vm.network "forwarded_port", guest:8082, host:8082, auto_correct: true
  	config.vm.network "forwarded_port", guest:3306, host:3306, auto_correct: true  
for i in 32760..32780
    	config.vm.network :forwarded_port, guest: i, host: i
end	
	# Docker Provisioner (Install image)
	config.vm.provision "docker" do |d|
		d.pull_images "ubuntu:14.04"
	end	

	# Hostname
	config.vm.hostname = "ch_web01"

	#Shell Script Part Updating APT Repository and create Synch Folder
	config.vm.provision :shell, inline: <<-SHELL
		sudo apt-get update
		sudo apt-get -y install apache2
		mkdir /etc/shared
	SHELL
	config.vm.synced_folder "./shared_web01", "/etc/shared"
	
	config.vm.provision "shell", path: "scripts/ufw.sh"
end

