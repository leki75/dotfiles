#!/bin/sh

# Install requisite packages
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add user to docker group
sudo usermod -a -G docker leki
