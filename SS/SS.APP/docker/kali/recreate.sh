#!/bin/bash

docker compose -f $TF_VAR_PATH_APP/docker/kali/docker-compose.yaml down
rm -rf $HOME/docker/kali
docker compose -f $TF_VAR_PATH_APP/docker/kali/docker-compose.yaml up -d --build
# docker exec -ti $TF_VAR_HACKINGTOOL_NAME sudo hackingtool
