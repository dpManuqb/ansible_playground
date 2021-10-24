# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = ENV["IMAGE_NAME"]
NUM_OF_MACHINES = ENV["NUM_OF_MACHINES"].to_i
NODE_NETWORK_BASE = ENV["NODE_NETWORK_BASE"]
NODE_IP_START = ENV["NODE_IP_START"].to_i
BRIDGE_INTERFACE = ENV["BRIDGE_INTERFACE"]

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    
    (0..(NUM_OF_MACHINES-1)).each do |i|
        config.vm.define "machine-#{i}" do |machine|
            machine.vm.box = IMAGE_NAME
            machine.vm.network "public_network", ip: "#{NODE_NETWORK_BASE}#{NODE_IP_START+1+i}", bridge: BRIDGE_INTERFACE
            machine.vm.hostname = "machine-#{i}"
            machine.vm.provider "virtualbox" do |v|
                v.memory = 1024
                v.cpus = 1
            end
            machine.vm.provision "file", source: "ssh/authorized_keys", destination: "/home/vagrant/authorized_keys"
            machine.vm.provision "shell", privileged: false, path: "provision/machine.sh"
        end
    end
    
    config.vm.define "ansible" do |ansible|
        ansible.vm.box = IMAGE_NAME
        ansible.vm.network "public_network", ip: "#{NODE_NETWORK_BASE}#{NODE_IP_START}", bridge: BRIDGE_INTERFACE
        ansible.vm.hostname = "ansible"
        ansible.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        ansible.vm.provision "file", source: "ssh", destination: "/home/vagrant"
        ansible.vm.provision "file", source: "hosts", destination: "/home/vagrant/hosts"
        ansible.vm.provision "shell", privileged: false, path: "provision/ansible.sh"
    end
end