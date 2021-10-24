#!/bin/sh

for i in $(seq 0 $(($NUM_OF_MACHINES - 1)))
do
    echo "machine-$i ansible_host=$NODE_NETWORK_BASE$(($NODE_IP_START + 1 + $i))" >> hosts
done