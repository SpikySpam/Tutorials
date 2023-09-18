![NPM Logo](_assets/images/vaultwarden.png)
# 05. Vaultwarden

![NPM Banner](_assets/images/bw_banner.png)

In this Tutorial we are going to setup **Vaultwarden** as our Password Manager

## Video

In this video I demonstrate how to install Vaultwarden on a fresh Ubuntu Virtual Machine (in ProxMox).

[![Video](_assets/images/vaultwarden-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXX)

## Links

- [Bitwarden Site](https://bitwarden.com)
- [Vaultwarden Github](https://github.com/dani-garcia/vaultwarden)

## Prerequisites

- [03. Nginx Proxy Manager](../03_nginx_proxy_manager/README.md)

## Add A-Records

- Navigate to [Digital Ocean](https://www.digitalocean.com/)
- Navigate to **Networking** in the **Digital Ocean** menu
- Click the tab **Domains**
- Choose your base domain
- Click **A**
- Create A-record:
  - **Hostname**: vaultwarden
  - **Will Direct To**: 46.101.80.89 (*💡 IP address of the NPM Droplet*)
  - Click **Create Record**

## Setup NPM Proxy Hosts

- Navigate to [NPM](https://spikyspam.site)
- Click **Add Proxy Host**
- **Domain Names**: 
  - vaultwarden.spikyspam.site ➡️ ***`TF_VAR_VAULTWARDEN_DOMAIN`***
- **Scheme**: http
- **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
- **Port**: 7000 ➡️ ***`TF_VAR_VAULTWARDEN_PORT`***
- Block Common Exploits
- Websockets Support
- **SSL**:
  - Let's Encrypt
  - Force SSL

## Forward port 7000 (***`TF_VAR_VAULTWARDEN_PORT`***) on your Router.

- Telenet:
  - Login into **mijn-telenet** and navigate to your home network settings:
https://mijn.telenet.be/mijntelenet/homenetwork/
  - Add the following port-forward rules:
    ```
    192.168.0.30 ➡️ 7000 HTTP/BOTH
    ```

## Install Vaultwarden

- Login into your [Ubuntu VM](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)

- Be sure to use the latest ***`.bash_profile`*** file:
  ```bash
  nano $TF_VAR_PATH/.bash_profile
  ```

- Create the following **docker-compose** file.
  ```bash
  mkdir $TF_VAR_PATH_APP/docker/vaultwarden
  nano $TF_VAR_PATH_APP/docker/vaultwarden/docker-compose.yaml
  ```

- Copy the content of [docker/vaultwarden/docker-compose.yaml](../SS/SS.APP/docker/vaultwarden/docker-compose.yaml)

- Deploy it using following command
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/vaultwarden/docker-compose.yaml up -d
  ```
