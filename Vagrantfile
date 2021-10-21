NUM_OF_MACHINES=2
BASE_IP="192.168.0."
START_IP=10

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.synced_folder ".", "/vagrant", disabled: true
    
    config.vm.define "ansible" do |ansible|
        ansible.vm.box = "bento/ubuntu-20.04"
        ansible.vm.network "public_network", ip: "#{BASE_IP}#{START_IP}", bridge: "TP-Link Wireless USB Adapter"
        ansible.vm.hostname = "ansible"
        ansible.vm.provider "virtualbox" do |v|
            v.memory = 1024
            v.cpus = 1
        end
        machine.vm.provision "file", source: "ssh", destination: "/home/vagrant/.ssh"
        machine.vm.provision "shell", inline: "chmod 600 /home/vagrant/.ssh/id_rsa"
    end

    (0..(NUM_OF_MACHINES-1)).each do |i|
        config.vm.define "machine-#{i}" do |machine|
            machine.vm.box = "bento/ubuntu-20.04"
            machine.vm.network "public_network", ip: "#{BASE_IP}#{START_IP+1+i}", bridge: "TP-Link Wireless USB Adapter"
            machine.vm.hostname = "machine-#{i}"
            machine.vm.provider "virtualbox" do |v|
                v.memory = 1024
                v.cpus = 1
            end
            machine.vm.provision "file", source: "ssh/authorized_keys", destination: "/home/vagrant/authorized_keys"
        end
    end
end