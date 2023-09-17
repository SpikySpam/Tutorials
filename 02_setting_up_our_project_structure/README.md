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

  See this [.bash_profile](../SS/.bash_profile_public) file for the latest version. **Passwords** and **Secret Keys** in this file are only examples, and are no where used. Otherwise let me know 😋

- Call the solutions .bash_pofile by editing **.bashrc**. Be sure to change the **`$TF_VAR_PATH`** variable to your local directory if needed:

  ```bash
  nano $HOME/.bashrc
  ```

  ```bash
  # .bashrc

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
  # /SS/version/docker/version.sh

  export TF_VAR_VERSION_DOCKER_NPM="github-pr-3117"    # https://hub.docker.com/r/jc21/nginx-proxy-manager/tags
  ```

- Create **Application Folders** for docker, helm and other configuration files

  ```bash
  mkdir $TF_VAR_PATH_APP/docker
  mkdir $TF_VAR_PATH_APP/helm
  mkdir $TF_VAR_PATH_APP/yaml
  ```

## Install Docker
<a id="install-docker"></a>
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
  