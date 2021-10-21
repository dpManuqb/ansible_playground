create-ssh-keys:
	scripts/create-ssh-keys.sh

install: create-ssh-keys
	vagrant up

run:
	vagrant up

delete:
	vagrant destroy -f && rm -rf .vagrant ssh