#!/bin/bash

docker run --rm -it vaultwarden/server:${TF_VAR_VERSION_DOCKER_VAULTWARDEN} ./vaultwarden hash
