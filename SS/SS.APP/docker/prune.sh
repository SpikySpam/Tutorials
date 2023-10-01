#!/bin/bash

# Ask Confirmation
source $TF_VAR_PATH/.bash_profile
initialize

# Completely clear Docker
docker rm -f $(docker ps -a -q)
docker system prune -a -f
docker volume prune -a -f

# Remove Persistence
OSTYPE_LINUX="linux-gnu"
OSTYPE_WINDOWS="msys"
if [ $OSTYPE == $OSTYPE_LINUX ]; then  
  sudo rm -rf $HOME/docker
else
  rm -rf $HOME/docker
fi
