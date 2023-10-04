#!/bin/bash

# 🚀 ----------------------------------
#              START SCRIPT
# 🚀 ----------------------------------
export TF_VAR_AUTOSTART=false
export INITIALIZE=true

# -- INITIALIZE
initialize () {

  if [ $INITIALIZE == false ]; then
    echo $DIV
    echo ✅ "Press ENTER to CONTINUE"
    echo ❌ "Press CTRL+C to EXIT"
    echo $DIV
    if [ $TF_VAR_AUTOSTART == false ]; then
      read
    fi
  fi

}

# -- INITIALIZE CONTAINER TOOL
initialize_cot () {

  if [ $TF_VAR_COT == $TF_VAR_COT_DOCKER ]; then
    docker info &> /dev/null 2>&1
    if [ $? -ne 0 ]; then
      echo $DIV
      echo ⛔ "DOCKER isn't running"
      echo $DIV
    fi
  elif [ $TF_VAR_COT == $TF_VAR_COT_PODMAN ]; then  
    if [[ ! $(podman machine ls -n) ]]; then
      echo $DIV
      echo 🦭 " Creating PODMAN machine"
      echo $DIV
      podman machine init $TF_VAR_COT_PODMAN --now
    fi
    export DOCKER_HOST="npipe:////./pipe/docker_engine"
  fi

}

# -- LOAD ENVIRONMENT VARIABLES
load_env_vars () {
  source $TF_VAR_PATH_MAIN/version/app/version.sh
  source $TF_VAR_PATH_MAIN/version/docker/version.sh
  source $TF_VAR_PATH_MAIN/version/helm/version.sh
  source $TF_VAR_PATH_MAIN/version/terraform/version.sh
  source $TF_VAR_PATH_MAIN/version/cli/version.sh
  source $TF_VAR_PATH_MAIN/version/cluster/version.sh

  source $TF_VAR_PATH_MAIN/ports.sh
}

# -- INSTALL CLI TOOLS
install_cli () {
  if [ $TF_VAR_OSTYPE == $TF_VAR_OSTYPE_LINUX ]; then
    $(find $TF_VAR_PATH -type f -iname "*.sh" -exec echo $TF_VAR_CODESERVER_PASSWORD \| sudo chmod +x {} \;) 2> /dev/null
    $(find $TF_VAR_PATH -type f -iname "*.sh" -exec sed -i -e 's/\r$//' {} \;) 2> /dev/null
  fi
  $TF_VAR_PATH_MAIN/cli.sh
}

# -- FINALIZE
finalize () {

  echo $DIV
  echo ✅ "ALL DONE"
  echo $DIV

}

#❗Don't include commands that need interaction before INITIALIZE is set to FALSE.
#❗This script will be called from ~/.bash_profile in various places and needs to exit.

load_env_vars
initialize
install_cli
initialize_cot
finalize

export INITIALIZE=false
