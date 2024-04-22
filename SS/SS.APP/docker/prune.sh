#!/bin/bash

# Ask Confirmation
source $TF_VAR_PATH/.bash_profile
initialize

# Completely clear Docker
$TF_VAR_COT rm -f $($TF_VAR_COT ps -a -q)
$TF_VAR_COT system prune -a -f
$TF_VAR_COT volume prune -a -f
$TF_VAR_COT network prune -f

# Remove Persistence
if [ $TF_VAR_OSTYPE == $TF_VAR_OSTYPE_LINUX ]; then  
  sudo rm -rf $HOME/docker
else
  rm -rf $HOME/docker
fi
