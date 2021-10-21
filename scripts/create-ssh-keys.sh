#!/bin/sh

mkdir -p ssh

ssh-keygen -t rsa -q -f ssh/id_rsa -C "ansible-provisioner" -N ""

cat ssh/id_rsa.pub >> ssh/authorized_keys

echo "n" | ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -N ""

cat $HOME/.ssh/id_rsa.pub >> ssh/authorized_keys