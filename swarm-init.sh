#!/bin/bash
if [ "$(hostname)" == "swarm00" ]; then
    docker swarm leave --force
    MANAGER_IP=$(hostname -I | awk '{print $2}')
    docker swarm init --advertise-addr $MANAGER_IP
    JOIN_TOKEN=$(docker swarm join-token worker -q)
    echo "JOIN_COMMAND= docker swarm join --token $JOIN_TOKEN $MANAGER_IP:2377" > /vagrant/join_command.env
else
    docker swarm leave
    source /vagrant/join_command.env
fi
