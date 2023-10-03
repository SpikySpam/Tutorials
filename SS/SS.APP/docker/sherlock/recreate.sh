#!/bin/bash

$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_SHERLOCK_NAME
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml up -d --wait --build
docker exec -ti $TF_VAR_SHERLOCK_NAME bash # python3 sherlock.py spikyspam