# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #define config var for each server (create a local scope)
  
  #defining config for db server 
  config.vm.define "dbServer" do |dbServer|  
    dbServer.vm.box = "ubuntu/trusty64"
	
	dbServer.vm.provider :virtualbox do |vb|
      # Don't boot with headless mode
      vb.gui = true
      vb.name = "(Project Wibble) DB Server (Ubuntu)"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
	
	#configure static private space IP
	dbServer.vm.network "private_network", ip: "10.0.0.100"
	
	#shared folder with the host
	dbServer.vm.synced_folder "dbServerShare/", "/var/hostShare", create: true
	
	#prvision with shell script
    dbServer.vm.provision :shell, path: "dbServerBootstrap.sh"
  end
  
  #defining config for worker server 
  config.vm.define "workerServer" do |workerServer|
    workerServer.vm.box = "ubuntu/trusty64"  
	
	workerServer.vm.provider :virtualbox do |vb|
      # Don't boot with headless mode
      vb.gui = true
      vb.name = "(Project Wibble) Worker Server (Ubuntu)"
      vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
	
	#configure static private space IP
	workerServer.vm.network "private_network", ip: "10.0.0.101"
	
	#shared folder with the host
	workerServer.vm.synced_folder "workerServerShare/", "/var/workerCli", create: true
	
	#prvision with shell script
    workerServer.vm.provision :shell, path: "workerServerBootstrap.sh"
  end
  
  #defining config for application server 
  config.vm.define "appServer" do |appServer| 
    appServer.vm.box = "ubuntu/trusty64"
	appServer.vm.network :forwarded_port, guest: 80, host: 8080
	
	appServer.vm.provider :virtualbox do |vb|
      # Don't boot with headless mode
      vb.gui = true
      vb.name = "(Project Wibble) Application Server (Ubuntu)"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
	
	#shared folder with the host
	appServer.vm.synced_folder "appServerShare/", "/var/www", create: true
	
	#configure static private space IP
	appServer.vm.network "private_network", ip: "10.0.0.102"
	
	#prvision with shell script
    appServer.vm.provision :shell, path: "appServerBootstrap.sh"
  end
  
end
