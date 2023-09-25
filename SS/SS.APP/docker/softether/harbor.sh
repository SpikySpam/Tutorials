#!/bin/bash

docker image build --tag harbor.$TF_VAR_DOMAIN/library/softether:$TF_VAR_VERSION_DOCKER_SOFTETHER $TF_VAR_PATH_LBRP_APPS/docker/houdini/softether
echo $TF_VAR_SOMEPASSWORD | docker login harbor.$TF_VAR_DOMAIN --username "admin" --password-stdin
docker image push harbor.$TF_VAR_DOMAIN/library/softether:$TF_VAR_VERSION_DOCKER_SOFTETHER
