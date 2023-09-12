![Structure Logo](_assets/images/structure.png)
# 02. Setting up our Project Structure

![Structure Banner](_assets/images/structure_banner.png)

In this Tutorial we are going to setup our **Project Structure** which we are going to use in many of the other Tutorials.
This part of the series will change often, depending on the progress, but will remain backwards-compatible with older Tutorials.

## Links

- [Spice Setup](https://pve.proxmox.com/wiki/SPICE)
- [Docker Setup](https://docs.docker.com/engine/install/ubuntu/)

## Prerequisites

- A Domain (*spikyspam.site* in this Tutorial*)
- A Digital Ocean Account (*any other DNS provider will do, like Cloudflare, ...*)
- [018. Install Ubuntu on ProxMox](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)

## Prepare Ubuntu VM

- On your Windows Host
  - Install [Virt Viewer](https://releases.pagure.org/virt-viewer/virt-viewer-x64-11.0-1.0.msi) (*https://virt-manager.org/download*)
  - Set VM Options in ProxMox:
    - VM -> Hardware -> Display -> SPICE
    - VM -> Hardware -> Processors -> Host

- On your Ubuntu Guest
  - Install some necessary **Packages**:
    ```bash
    sudo apt update && sudo apt upgrade -y

    sudo apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu-kvm qemu-guest-agent curl
    ```
  - Your IP address should be **192.168.0.30** (*for this tutorial*)

## Setup Project Environment

- Create a **.bash_profile** file in your Solution Folder ⚠️

  For this tutorial we are using the following solution folder location:

  ```bash
  $HOME/Desktop/Tutorials/SS
  ```

  This is the main script for our complete **Solution**.
  Without it nothing will work.
  You need to add this file to your **.gitignore** file. 💥

  ```bash
  mkdir $HOME/Desktop/Tutorials
  mkdir $HOME/Desktop/Tutorials/SS

  nano $HOME/Desktop/Tutorials/SS/.bash_profile
  ```

  ```bash
  #!/bin/bash

  history -c
  clear
  export DIV="--------------------------------------------------"

  echo $DIV
  echo 😎 LOADING BASH PROFILE INTO MEMORY
  echo $DIV

  # SET PATHS
  export TF_VAR_PATH_MAIN=$TF_VAR_PATH/SS
  export TF_VAR_PATH_APP=$TF_VAR_PATH/SS.APP
  export TF_VAR_PATH_CLI=$TF_VAR_PATH/SS/CLI
  export PATH="$TF_VAR_PATH_CLI:$PATH"

  # SET SECRETS
  export TF_VAR_NPM_USER="fghytr"
  export TF_VAR_NPM_PASSWORD="6h98zCGrGdNAtTDbuW3KZeM2"
  export TF_VAR_MAILINABOX_USER="admin@spikyspam.site"
  export TF_VAR_MAILINABOX_PASSWORD="D7nNxUGe3VFKC47ZmqcLyX9Q"

  # SET ALIASSES
  alias cdss='cd $TF_VAR_PATH; clear'
  alias k='kubectl'
  alias t='terraform'
  alias ti='t init'
  alias ta='t apply'
  alias taa='ta -auto-approve'
  alias taar='terraform apply -refresh=false -auto-approve'
  alias tp='t plan'
  alias tpr='tp -refresh=false'
  alias td='t destroy'
  alias tda='td -auto-approve'
  alias tdar='tda -refresh=false'
  alias tv='t validate'
  alias tr='t refresh'

  export INITIALIZE="true"

  # INITIALIZE
  initialize () {

    if [ $INITIALIZE == "false" ]; then
      echo
      echo ✅ "Press ENTER to CONTINUE"
      echo ❌ "Press CTRL+C to EXIT"
      echo $DIV
      if [ $TF_VAR_C_AUTOSTART == false ]; then
        read
      fi
    fi

  }

  # LOAD VERSIONS
  load_versions () {
    source $TF_VAR_PATH_MAIN/version/app/version.sh
    source $TF_VAR_PATH_MAIN/version/docker/version.sh
    source $TF_VAR_PATH_MAIN/version/helm/version.sh
    source $TF_VAR_PATH_MAIN/version/terraform/version.sh
    source $TF_VAR_PATH_MAIN/version/cli/version.sh
    source $TF_VAR_PATH_MAIN/version/cluster/version.sh
  }

  # FINALIZE
  finalize () {

    echo $DIV
    echo ✅ "ALL DONE"
    echo $DIV

  }

  #❗Don't include commands that need interaction before INITIALIZE is set to FALSE.
  #❗This script will be called from ~/.bash_profile in various places and needs to exit.

  load_versions
  initialize

  # if [ $INITIALIZE == "false" ]; then

  # fi

  finalize

  export INITIALIZE="false"
  ```


- Call the solutions .bash_pofile by editing **.bashrc**. Be sure to change the **`$TF_VAR_PATH`** variable to your local directory if needed:

  ```bash
  nano $HOME/.bashrc
  ```

  ```bash
  export TF_VAR_PATH=$HOME/Desktop/Tutorials/SS
  source $TF_VAR_PATH/.bash_profile
  ```

- Reload your Environment. (*close and re-open your Terminal*)

  ```bash
  source $HOME/.bashrc
  ```

- Create **Project Folders** in your solution:

  ```bash
  mkdir $TF_VAR_PATH/SS
  mkdir $TF_VAR_PATH/SS/version
  mkdir $TF_VAR_PATH/SS/version/app
  mkdir $TF_VAR_PATH/SS/version/cli
  mkdir $TF_VAR_PATH/SS/version/cluster
  mkdir $TF_VAR_PATH/SS/version/docker
  mkdir $TF_VAR_PATH/SS/version/helm
  mkdir $TF_VAR_PATH/SS/version/terraform
  mkdir $TF_VAR_PATH/SS/CLI
  mkdir $TF_VAR_PATH/SS.APP
  ```

- Create **Version Environment** variables scripts:

  ```bash
  touch $TF_VAR_PATH/SS/version/app/version.sh
  touch $TF_VAR_PATH/SS/version/cli/version.sh
  touch $TF_VAR_PATH/SS/version/docker/version.sh
  touch $TF_VAR_PATH/SS/version/cluster/version.sh
  touch $TF_VAR_PATH/SS/version/helm/version.sh
  touch $TF_VAR_PATH/SS/version/terraform/version.sh

  nano $TF_VAR_PATH/SS/version/docker/version.sh
  ```

  ```bash
  export TF_VAR_VERSION_DOCKER_NPM="github-pr-3117"    # https://hub.docker.com/r/jc21/nginx-proxy-manager/tags
  ```

- Create **Application Folders** for docker, helm and other configuration files

  ```bash
  mkdir $TF_VAR_PATH_APP/docker
  mkdir $TF_VAR_PATH_APP/helm
  mkdir $TF_VAR_PATH_APP/yaml
  ```

## Install Docker

- Execute the following commands to **Install Docker**:

  ```bash
  curl -sSL https://get.docker.com/ | sh

  sudo usermod -aG docker $USER
  newgrp docker

  sudo service docker start

  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  ```

- **Reboot** the VM:

  ```bash
  reboot
  ```
  