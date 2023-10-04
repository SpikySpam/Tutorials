#!/bin/bash

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_SHERLOCK_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml up -d --wait --build

# ⬇️
docker exec -ti $TF_VAR_SHERLOCK_NAME bash python3 sherlock.py $TF_VAR_GITHUB_USER