Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/trusty64"
	config.vm.provision :shell, inline: <<-SHELL
		sudo apt-get update
		sudo apt-get -y install apache2
		mkdir /etc/shared
	SHELL
	config.vm.synced_folder "./shared", "/etc/shared"
end
