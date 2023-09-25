#!/bin/bash

docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_MYSQL_NAME
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml up -d