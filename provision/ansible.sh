#!/bin/sh

cat /home/vagrant/authorized_keys >> /home/vagrant/.ssh/authorized_keys
mv /home/vagrant/id_rsa /home/vagrant/.ssh/id_rsa
mv /home/vagrant/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
chmod 600 /home/vagrant/.ssh/id_rsa

cat <<EOF > ansible.cfg
[defaults]
inventory = hosts
remote_user = vagrant
remote_port = 22
host_key_checking = False
EOF

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ansible -y