#!/bin/bash

history -c
clear
export DIV="--------------------------------------------------"

echo $DIV
echo 😎 LOADING BASH PROFILE INTO MEMORY
echo $DIV

# 💾 SET PATHS
export TF_VAR_PATH_MAIN=$TF_VAR_PATH/SS
export TF_VAR_PATH_APP=$TF_VAR_PATH/SS.APP
export TF_VAR_PATH_CLI=$TF_VAR_PATH/SS/CLI
export TF_VAR_PATH_HELP=$TF_VAR_PATH/SS.HELPERS
export PATH="$TF_VAR_PATH_CLI:$PATH"

# 🌐 CURRENT ENVIRONMENT
# -- OS
export TF_VAR_OSTYPE=$OSTYPE
export TF_VAR_OSTYPE_LINUX="linux-gnu"
export TF_VAR_OSTYPE_WINDOWS="msys"
# -- Container Tool
export TF_VAR_COT_DOCKER="docker"
export TF_VAR_COT_PODMAN="podman"
export TF_VAR_COT=$TF_VAR_COT_DOCKER # ⬅️ Choose your Container Orchestration Tool here

# 1️⃣ ----------------------------------
#              SECRETZ
# 1️⃣ ----------------------------------
source $TF_VAR_PATH/no-regrets.sh
# source $TF_VAR_PATH/no-secrets.sh

# 2️⃣ ----------------------------------
#              SET ALIASSES
# 2️⃣ ----------------------------------
source $TF_VAR_PATH/alias.sh

# 3️⃣ ----------------------------------
#              START SCRIPT
# 3️⃣ ----------------------------------
source $TF_VAR_PATH/start.sh
