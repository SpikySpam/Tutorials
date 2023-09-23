#!/bin/bash

install_cli_lychee() {

  if [[ "$OSTYPE" == "linux-gnu"* ]]
  then
    curl -sSLo $TF_VAR_PATH_CLI/lychee.tar.gz https://github.com/lycheeverse/lychee/releases/download/$TF_VAR_VERSION_CLI_LYCHEE/lychee-$TF_VAR_VERSION_CLI_LYCHEE-x86_64-unknown-linux-gnu.tar.gz
    tar -xf $TF_VAR_PATH_CLI/lychee.tar.gz
    rm -f $TF_VAR_PATH_CLI/lychee.tar.gz
  elif [[ "$OSTYPE" == "darwin"* ]]
  then
    curl -sSLo $TF_VAR_PATH_CLI/lychee.dmg https://github.com/lycheeverse/lychee/releases/download/$TF_VAR_VERSION_CLI_LYCHEE/lychee-$TF_VAR_VERSION_CLI_LYCHEE-macos-x86_64.dmg
  elif [[ "$OSTYPE" == "msys" ]]
  then
    curl -sSLo $TF_VAR_PATH_CLI/lychee.exe https://github.com/lycheeverse/lychee/releases/download/$TF_VAR_VERSION_CLI_LYCHEE/lychee-$TF_VAR_VERSION_CLI_LYCHEE-windows-x86_64.exe
  fi

}

install_cli_lychee
