# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
   config.vm.box = "centos/7" 
   config.vm.box_version = "2004.01" 
   config.vm.provider "virtualbox" do |v| 
   v.memory = 256 
   v.cpus = 1
   end
   config.vm.define "nfsserver" do |nfsserver| 
      nfsserver.vm.network "private_network", ip: "192.168.50.10",  virtualbox__intnet: "net1" 
      nfsserver.vm.hostname = "nfsserver"
      nfsserver.vm.provision :file, source: './scripts', destination: '/home/vagrant/scripts'
      nfsserver.vm.provision "shell", inline: <<-SHELL
         yum update
         yum -y install nfs-utils
         sudo chmod u+x ./scripts/*.sh
      SHELL
      nfsserver.vm.provision "shell", path: "./scripts/script_nsfserver.sh"
   end
   config.vm.synced_folder '.', '/vagrant', disabled: true

   config.vm.define "nfsclient" do |nfsclient| 
      nfsclient.vm.network "private_network", ip: "192.168.50.11",  virtualbox__intnet: "net1" 
      nfsclient.vm.hostname = "nfsclient" 
      nfsclient.vm.provision :file, source: './scripts', destination: '/home/vagrant/scripts'
      nfsclient.vm.provision "shell", inline: <<-SHELL
         yum update
         yum -y install nfs-utils
         sudo chmod u+x ./scripts/*.sh
      SHELL
      nfsclient.vm.provision "shell", path: "./scripts/script_nfsclient.sh"
   end
   config.vm.synced_folder '.', '/vagrant', disabled: true
end 