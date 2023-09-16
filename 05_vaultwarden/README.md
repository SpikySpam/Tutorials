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

## Create Ubuntu Desktop VM

- **Login** into your **ProxMox** dashboard
- **Clone** your previously installed Ubuntu Desktop VM to a new one.
- **Start** the new VM

## Install Vaultwarden

- Create the following **docker-compose** file.

  ```bash
  mkdir $TF_VAR_PATH_APP/docker/vaultwarden
  nano $TF_VAR_PATH_APP/docker/vaultwarden/docker-compose.yaml
  ```

  ```yaml
  version: '3.8'

  services:
    npm: 
      container_name: npm
      image: jc21/nginx-proxy-manager:${TF_VAR_VERSION_DOCKER_NPM}
      restart: unless-stopped
      environment:
        PUID: 1000
        PGID: 1000
      ports:
        - "80:80"
        - "81:81"
        - "443:443"
      volumes:
        - $HOME/docker/npm/data:/data
        - $HOME/docker/npm/letsencrypt:/etc/letsencrypt
  ```

- Deploy it using following command
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/npm/docker-compose.yaml up -d
  ```

## Add A-Record at your DNS

- Navigate to the [Networking](https://cloud.digitalocean.com/networking) section of Digital Ocean (*or your DNS provider of choice, like CloudFlare, …*)
- Click Domains and add an A-record that points to your public WAN IP.

![Digital Ocean DNS](_assets/images/dns.png)

## Setup NPM Proxy Hosts

- **vaultwarden.spikyspam.site** -> https://192.168.0.32:xxx (*with Let's Encrypt*)     
