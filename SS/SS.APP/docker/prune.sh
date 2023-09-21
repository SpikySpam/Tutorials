#!/bin/bash

# Ask Confirmation
source $TF_VAR_PATH/.bash_profile
initialize

# Completely clear Docker
docker rm -f $(docker ps -a -q)
docker system prune -a -f
sudo rm -rf $HOME/docker
