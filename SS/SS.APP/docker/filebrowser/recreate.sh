#!/bin/bash

# Docker Compose will mount a volume to a directory instead of a file
# We need to create empty files first

touch $HOME/docker/$TF_VAR_FILEBROWSER_NAME/filebrowser.db
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_FILEBROWSER_NAME/docker-compose.yaml up -d
