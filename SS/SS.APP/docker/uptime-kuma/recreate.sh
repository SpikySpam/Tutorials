#!/bin/bash

$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_UPTIMEKUMA_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_UPTIMEKUMA_NAME
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_UPTIMEKUMA_NAME/docker-compose.yaml up -d --wait --build