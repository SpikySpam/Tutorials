#!/bin/bash

OSTYPE_LINUX="linux-gnu"
OSTYPE_WINDOWS="msys"

CLI_NAME_GITLEAKS="gitleaks"
CLI_NAME_HELM="helm"
CLI_NAME_JQ="jq"
CLI_NAME_K6="k6"
CLI_NAME_KIND="kind"
CLI_NAME_KUBECTL="kubectl"
CLI_NAME_LYCHEE="lychee"
CLI_NAME_MOVE2KUBE="move2kube"
CLI_NAME_POPEYE="popeye"
CLI_NAME_STEP="step"
CLI_NAME_TERRAFORM="terraform"

cli_install_gitleaks() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v$TF_VAR_VERSION_CLI_GITLEAKS/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_linux_x32.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz -C $TF_VAR_PATH_CLI $CLI_NAME_GITLEAKS
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip https://github.com/$CLI_NAME_GITLEAKS/$CLI_NAME_GITLEAKS/releases/download/v$TF_VAR_VERSION_CLI_GITLEAKS/${CLI_NAME_GITLEAKS}_${TF_VAR_VERSION_CLI_GITLEAKS}_windows_x32.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip $CLI_NAME_GITLEAKS.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_GITLEAKS.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_GITLEAKS" "$(gitleaks version)

}

cli_install_helm() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_HELM*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_HELM.tar.gz https://get.$CLI_NAME_HELM.sh/$CLI_NAME_HELM-v$TF_VAR_VERSION_CLI_HELM-linux-amd64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_HELM.tar.gz -C $TF_VAR_PATH_CLI linux-amd64/$CLI_NAME_HELM --strip-components 1
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_HELM.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_HELM
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_HELM.zip https://get.$CLI_NAME_HELM.sh/$CLI_NAME_HELM-v$TF_VAR_VERSION_CLI_HELM-windows-amd64.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_HELM.zip windows-amd64/$CLI_NAME_HELM.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_HELM.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_HELM.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_HELM" "$(helm version)

}

cli_install_jq() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_JQ*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_JQ https://github.com/jqlang/$CLI_NAME_JQ/releases/download/$CLI_NAME_JQ-$TF_VAR_VERSION_CLI_JQ/$CLI_NAME_JQ-linux64
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_JQ
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_JQ.exe https://github.com/jqlang/$CLI_NAME_JQ/releases/download/$CLI_NAME_JQ-$TF_VAR_VERSION_CLI_JQ/$CLI_NAME_JQ-win64.exe
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_JQ.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(jq --version)

}

cli_install_k6() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_K6*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_K6.tar.gz https://github.com/grafana/$CLI_NAME_K6/releases/download/v$TF_VAR_VERSION_CLI_K6/$CLI_NAME_K6-v$TF_VAR_VERSION_CLI_K6-linux-amd64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_K6.tar.gz -C $TF_VAR_PATH_CLI $CLI_NAME_K6-v$TF_VAR_VERSION_CLI_K6-linux-amd64/$CLI_NAME_K6 --strip-components 1
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_K6.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_K6
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_K6.zip https://github.com/grafana/$CLI_NAME_K6/releases/download/v$TF_VAR_VERSION_CLI_K6/$CLI_NAME_K6-v$TF_VAR_VERSION_CLI_K6-windows-amd64.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_K6.zip $CLI_NAME_K6-v$TF_VAR_VERSION_CLI_K6-windows-amd64/$CLI_NAME_K6.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_K6.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_K6.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(k6 version)

}

cli_install_kind() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_KIND*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_KIND https://github.com/kubernetes-sigs/$CLI_NAME_KIND/releases/download/v$TF_VAR_VERSION_CLI_KIND/$CLI_NAME_KIND-linux-amd64
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_KIND
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_KIND.exe https://github.com/kubernetes-sigs/$CLI_NAME_KIND/releases/download/v$TF_VAR_VERSION_CLI_KIND/$CLI_NAME_KIND-windows-amd64
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_KIND.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(kind version)

}

cli_install_kubectl() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_KUBECTL*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_KUBECTL https://dl.k8s.io/release/v$TF_VAR_VERSION_CLI_KUBECTL/bin/linux/amd64/$CLI_NAME_KUBECTL
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_KUBECTL
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_KUBECTL.exe https://dl.k8s.io/release/v$TF_VAR_VERSION_CLI_KUBECTL/bin/windows/amd64/$CLI_NAME_KUBECTL.exe
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_KUBECTL.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_KUBECTL" "$(kubectl version --client=false)

}

cli_install_lychee() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v$TF_VAR_VERSION_CLI_LYCHEE/$CLI_NAME_LYCHEE-v$TF_VAR_VERSION_CLI_LYCHEE-x86_64-unknown-linux-gnu.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz -C $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.exe https://github.com/lycheeverse/$CLI_NAME_LYCHEE/releases/download/v$TF_VAR_VERSION_CLI_LYCHEE/$CLI_NAME_LYCHEE-v$TF_VAR_VERSION_CLI_LYCHEE-windows-x86_64.exe
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_LYCHEE.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(lychee --version)

}

cli_install_move2kube() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.tar.gz https://github.com/konveyor/$CLI_NAME_MOVE2KUBE/releases/download/v$TF_VAR_VERSION_CLI_MOVE2KUBE/move2kube-v$TF_VAR_VERSION_CLI_MOVE2KUBE-linux-amd64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.tar.gz -C $TF_VAR_PATH_CLI $CLI_NAME_MOVE2KUBE/$CLI_NAME_MOVE2KUBE --strip-components 1
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.zip https://github.com/konveyor/$CLI_NAME_MOVE2KUBE/releases/download/v$TF_VAR_VERSION_CLI_MOVE2KUBE/move2kube-v$TF_VAR_VERSION_CLI_MOVE2KUBE-windows-amd64.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.zip $CLI_NAME_MOVE2KUBE/$CLI_NAME_MOVE2KUBE.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_MOVE2KUBE.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_MOVE2KUBE" "$(move2kube version)

}

cli_install_popeye() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_POPEYE*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz https://github.com/derailed/$CLI_NAME_POPEYE/releases/download/v$TF_VAR_VERSION_CLI_POPEYE/${CLI_NAME_POPEYE}_Linux_x86_64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz -C $TF_VAR_PATH_CLI $CLI_NAME_POPEYE
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz https://github.com/derailed/$CLI_NAME_POPEYE/releases/download/v$TF_VAR_VERSION_CLI_POPEYE/${CLI_NAME_POPEYE}_Windows_x86_64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz -C $TF_VAR_PATH_CLI $CLI_NAME_POPEYE.exe
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_POPEYE.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $CLI_NAME_POPEYE $TF_VAR_VERSION_CLI_POPEYE

}

cli_install_step() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_STEP*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_STEP.tar.gz https://dl.smallstep.com/gh-release/cli/gh-release-header/v0.24.4/${CLI_NAME_STEP}_linux_${TF_VAR_VERSION_CLI_STEP}_amd64.tar.gz
      tar -zxf $TF_VAR_PATH_CLI/$CLI_NAME_STEP.tar.gz -C $TF_VAR_PATH_CLI ${CLI_NAME_STEP}_$TF_VAR_VERSION_CLI_STEP/bin/$CLI_NAME_STEP --strip-components 2
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_STEP.tar.gz
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_STEP
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_STEP.zip https://dl.smallstep.com/gh-release/cli/gh-release-header/v0.24.4/${CLI_NAME_STEP}_windows_${TF_VAR_VERSION_CLI_STEP}_amd64.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_STEP.zip ${CLI_NAME_STEP}_$TF_VAR_VERSION_CLI_STEP/bin/$CLI_NAME_STEP.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_STEP.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_STEP.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(step version)

}

cli_install_terraform() {

  if ! compgen -G "$TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM*" > /dev/null; then
    if [ $OSTYPE == $OSTYPE_LINUX ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip  https://releases.hashicorp.com/$CLI_NAME_TERRAFORM/$TF_VAR_VERSION_CLI_TERRAFORM/${CLI_NAME_TERRAFORM}_${TF_VAR_VERSION_CLI_TERRAFORM}_linux_386.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip $CLI_NAME_TERRAFORM -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM
    elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
      curl -sSLo $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip  https://releases.hashicorp.com/$CLI_NAME_TERRAFORM/$TF_VAR_VERSION_CLI_TERRAFORM/${CLI_NAME_TERRAFORM}_${TF_VAR_VERSION_CLI_TERRAFORM}_windows_386.zip
      unzip -oqj $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip $CLI_NAME_TERRAFORM.exe -d $TF_VAR_PATH_CLI
      rm -f $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.zip
      chmod +x $TF_VAR_PATH_CLI/$CLI_NAME_TERRAFORM.exe
    fi
    echo -n "⬇ "
  else
    echo -n "√ "
  fi
  [ $INITIALIZE == false ] && echo $(terraform version)

}

echo $DIV
echo ⬇️ " Downloading CLI tools"
echo $DIV

cli_install_gitleaks
cli_install_helm
cli_install_jq
cli_install_k6
cli_install_kind
cli_install_kubectl
cli_install_lychee
cli_install_move2kube
cli_install_popeye
cli_install_step
cli_install_terraform

[ $INITIALIZE != false ] && echo
