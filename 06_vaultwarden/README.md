![NPM Logo](_assets/images/vaultwarden.png)
# 05. Vaultwarden

![NPM Banner](_assets/images/bw_banner.png)

In this Tutorial we are going to setup **Vaultwarden** as our **Password Manager**

## Video

In this video I demonstrate how to install **Vaultwarden** on a Ubuntu Virtual Machine (in ProxMox) inside a **Docker** container.

[![Video](_assets/images/vaultwarden-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXX)

## Links

- [Bitwarden Site](https://bitwarden.com)
- [Vaultwarden Github](https://github.com/dani-garcia/vaultwarden)

## Prerequisites

- [05. Databases](../05_databases/README.md)

## Add A-Records

- Browse to your [04. Mail-in-a-Box](../04_mail_in_a_box/README.md) address.
- Navigate to **Custom DNS** in the **System** menu
- Create A-record:
  - **Name**: vaultwarden
  - **Type**: A
  - **Value**: 46.101.80.89
  - Click **Set Record**

## Add Proxy-Host

- Navigate to your [03. Nginx Proxy Manager](../03_nginx_proxy_manager/README.md) address.
- Click **Add Proxy Host**:
  - **Domain Names**: 
    - vaultwarden.spikyspam.site ➡️ ***`TF_VAR_VAULTWARDEN_DOMAIN`***
  - **Scheme**: http
  - **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
  - **Port**: 7000 ➡️ ***`TF_VAR_VAULTWARDEN_PORT_EXT`***
  - Block Common Exploits
  - Websockets Support
  - **SSL**:
    - Let's Encrypt
    - Force SSL

## Forward port 7000 (***`TF_VAR_VAULTWARDEN_PORT_EXT`***) on your Router.

- Telenet:
  - Login into **mijn-telenet** and navigate to your home network settings:
https://mijn.telenet.be/mijntelenet/homenetwork/
  - Add the following port-forward rules:
    ```
    192.168.0.30 ➡️ 7000 HTTP/BOTH
    ```

## Install Vaultwarden

- Get the latest sources as explained in [05. Databases](../05_databases/README.md#latest-sources)
- 💥💥💥💥 vaultwarden hash in docker container

- Install Vaultwarden
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_VAULTWARDEN_NAME/docker-compose.yaml up -d
  ```

## Configure Vaultwarden

- Navigate to **https://vaultwarden.spikyspam.site/admin**
- Login with your **`$TF_VAR_VAULTWARDEN_ADMIN_PASSWORD`**
- You can now **Invite Users**