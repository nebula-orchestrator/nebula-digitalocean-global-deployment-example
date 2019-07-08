#!/bin/sh

sudo yum install -y curl
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo pip install docker-compose
sudo curl -L "https://raw.githubusercontent.com/nebula-orchestrator/docs/master/examples/hello-world/start_example_nebula_cluster.sh" -o start_example_nebula_cluster.sh && sudo sh start_example_nebula_cluster.sh
