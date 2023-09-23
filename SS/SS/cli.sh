#!/bin/bash

OSTYPE_LINUX="linux-gnu"
OSTYPE_WINDOWS="msys"

install_cli_lychee() {

  if [ $OSTYPE == $OSTYPE_LINUX ]; then
    curl -sSLo $TF_VAR_PATH_CLI/lychee.tar.gz https://github.com/lycheeverse/lychee/releases/download/$TF_VAR_VERSION_CLI_LYCHEE/lychee-$TF_VAR_VERSION_CLI_LYCHEE-x86_64-unknown-linux-gnu.tar.gz
    tar -xf $TF_VAR_PATH_CLI/lychee.tar.gz -C $TF_VAR_PATH_CLI
    rm -f $TF_VAR_PATH_CLI/lychee.tar.gz
  elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
    curl -sSLo $TF_VAR_PATH_CLI/lychee.exe https://github.com/lycheeverse/lychee/releases/download/$TF_VAR_VERSION_CLI_LYCHEE/lychee-$TF_VAR_VERSION_CLI_LYCHEE-windows-x86_64.exe
  fi

}

install_cli_lychee
