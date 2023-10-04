#!/bin/bash

# Docker Compose will mount a volume to a directory instead of a file
# We need to create empty files first
mkdir -p $HOME/docker/$TF_VAR_FILEBROWSER_NAME
touch $HOME/docker/$TF_VAR_FILEBROWSER_NAME/filebrowser.db

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_FILEBROWSER_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_FILEBROWSER_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_FILEBROWSER_NAME/docker-compose.yaml up -d --wait --build

# ⬇️