#!/bin/bash

# Create Image
$TF_VAR_PATH_APP/docker/$TF_VAR_CHATGPT_NAME/image/recreate.sh

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_CHATGPT_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_CHATGPT_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_CHATGPT_NAME/docker-compose.yaml  up -d --wait --build

# ⬇️
