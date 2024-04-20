#!/bin/bash

# Create Ubuntu Image
if [[ "$(docker images -q ${TF_DOMAIN}/ubuntu:${TF_VAR_VERSION_DOCKER_UBUNTU} 2> /dev/null)" == "" ]]; then
  $TF_VAR_PATH_APP/docker/$TF_VAR_UBUNTU_NAME/recreate.sh
fi

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HACK_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_HACK_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HACK_NAME/docker-compose.yaml up -d --wait --build --build

# ⬇️