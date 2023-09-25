#!/bin/bash

docker run --rm -it guacamole/guacamole:${TF_VAR_VERSION_DOCKER_GUACAMOLE} ./bin/initdb.sh --mysql > ${TF_VAR_PATH_APP}/docker/${TF_VAR_GUACAMOLE_NAME}/config/${TF_VAR_MYSQL_NAME}/init.sql
