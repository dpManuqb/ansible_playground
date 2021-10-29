.EXPORT_ALL_VARIABLES:

IMAGE_NAME = bento/ubuntu-20.04
#BRIDGE_INTERFACE = Intel(R) Wireless-AC 9560
BRIDGE_INTERFACE = TP-Link Wireless USB Adapter

NODE_NETWORK_BASE = 192.168.0.
NODE_IP_START = 10

NUM_OF_MACHINES = 2

create-ssh-keys:
	scripts/create-ssh-keys.sh

create-hosts-file:
	scripts/create-hosts-file.sh
	
install: create-ssh-keys create-hosts-file
	vagrant up

run:
	vagrant up

halt:
	vagrant halt
	
delete:
	vagrant destroy -f && rm -rf .vagrant ssh hosts