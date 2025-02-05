# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  nodes = [
     { name: "swarm00", ip: "10.10.10.100" },
     { name: "swarm01", ip: "10.10.10.101" },
     { name: "swarm02", ip: "10.10.10.102" }
  ]
 
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
 
  nodes.each do |node|
     config.vm.define node[:name] do |swarm|
      swarm.vm.box = "generic/ubuntu2304"
      swarm.vm.hostname = "#{node[:name]}.node.com"
      swarm.vm.network :private_network, ip: node[:ip]
      config.vm.provider "virtualbox" do |v|
      end
      swarm.vm.provision "file", source: "myExpress", destination: "myExpress"
      swarm.vm.provision "shell", path: "provision-docker.sh"
      swarm.vm.provision "shell", path: "swarm-init.sh"
      swarm.vm.provision "shell", inline: <<-SHELL
         cd myExpress   
         docker build -t myexpress .
      SHELL
     end
  end
 end
