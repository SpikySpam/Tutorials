#!/bin/bash

OSTYPE_LINUX="linux-gnu"
OSTYPE_WINDOWS="msys"

CLI_NAME_LYCHEE="lychee"
CLI_NAME_GITLEAKS="gitleaks"

cli_install_lychee() {

  echo -n $CLI_NAME_LYCHEE
  if [ ! -f "$TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE*" ]; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
        curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v${TF_VAR_VERSION_CLI_LYCHEE}/$CLI_NAME_LYCHEE-v${TF_VAR_VERSION_CLI_LYCHEE}-x86_64-unknown-linux-gnu.tar.gz
        tar -xf $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz -C $TF_VAR_PATH_CLI
        rm -f $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
        curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.exe https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v${TF_VAR_VERSION_CLI_LYCHEE}/$CLI_NAME_LYCHEE-v${TF_VAR_VERSION_CLI_LYCHEE}-windows-x86_64.exe
    fi
  fi
  echo " ✅"

}

cli_install_gitleaks() {

  echo -n $CLI_NAME_GITLEAKS
  if [ ! -f "$TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS*" ]; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
        curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v${TF_VAR_VERSION_CLI_GITLEAKS}/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_linux_x32.tar.gz
        tar -xf $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz -C $TF_VAR_PATH_CLI
        rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
        curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v${TF_VAR_VERSION_CLI_GITLEAKS}/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_windows_x32.zip
        unzip -oq $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip $CLI_NAME_GITLEAKS.exe -d $TF_VAR_PATH_CLI
        rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip
    fi
  fi
  echo " ✅"

}

echo $DIV
echo 💾 "Downloading CLI tools"
echo $DIV

cli_install_lychee
cli_install_gitleaks

