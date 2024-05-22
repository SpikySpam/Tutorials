#!/bin/bash

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PAPERCUT_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_PAPERCUT_NAME

docker system prune -a -f

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PAPERCUT_NAME/docker-compose.yaml  up -d --wait --build

# ⬇️