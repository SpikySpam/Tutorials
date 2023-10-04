#!/bin/bash

# Initialize database
$TF_VAR_PATH_APP/docker/$TF_VAR_GUACAMOLE_NAME/init_db.sh

# Clean Previous
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GUACAMOLE_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_GUACAMOLE_NAME

# Compose Up
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GUACAMOLE_NAME/docker-compose.yaml up -d --wait --build

# ⬇️