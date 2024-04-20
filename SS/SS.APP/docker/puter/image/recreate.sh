#!/bin/bash

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PUTER_NAME/image/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_PUTER_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PUTER_NAME/image/docker-compose.yaml  up -d --wait --build

# ⬇️
$TF_VAR_COT commit $TF_VAR_PUTER_NAME $TF_VAR_DOMAIN/$TF_VAR_PUTER_NAME:$TF_VAR_VERSION_DOCKER_PUTTER