#!/bin/bash

OSTYPE_LINUX="linux-gnu"
OSTYPE_WINDOWS="msys"

CLI_NAME_LYCHEE="lychee"
CLI_NAME_GITLEAKS="gitleaks"

cli_install_lychee() {

  if ! compgen -G "${TF_VAR_PATH_CLI}/$CLI_NAME_LYCHEE*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v${TF_VAR_VERSION_CLI_LYCHEE}/$CLI_NAME_LYCHEE-v${TF_VAR_VERSION_CLI_LYCHEE}-x86_64-unknown-linux-gnu.tar.gz
      tar -xf $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz -C $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.exe https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v${TF_VAR_VERSION_CLI_LYCHEE}/$CLI_NAME_LYCHEE-v${TF_VAR_VERSION_CLI_LYCHEE}-windows-x86_64.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_LYCHEE

}

cli_install_gitleaks() {

  if ! compgen -G "${TF_VAR_PATH_CLI}/$CLI_NAME_GITLEAKS*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v${TF_VAR_VERSION_CLI_GITLEAKS}/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_linux_x32.tar.gz
      tar -xf $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz -C $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v${TF_VAR_VERSION_CLI_GITLEAKS}/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_windows_x32.zip
      unzip -oq $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip $CLI_NAME_GITLEAKS.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_GITLEAKS

}

echo $DIV
echo ⬇️ " Downloading CLI tools"
echo $DIV

cli_install_lychee
cli_install_gitleaks

[ $INITIALIZE != false ] && echo
