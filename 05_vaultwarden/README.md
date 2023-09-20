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

- [04. Mail-in-a-Box](../04_mail_in_a_box/README.md) and its prerequisites.
- **npm** A-record in **Mail-in-a-Box**

## Add A-Records

- Browse to your [04. Mail-in-a-Box](../04_mail_in_a_box/README.md) address.
- Navigate to **Custom DNS** in the **System** menu
- Create 2 A-records:
  - A1:
    - **Name**: npm
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**
  - A2:
    - **Name**: vaultwarden
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**

## Setup NPM Proxy Hosts

- Navigate to [NPM](https://spikyspam.site)
- Click **Add Proxy Host**:
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

- **Login** into your [Ubuntu VM](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)
- Get the latest relevant **Sources** from **GitHub**:
  ```bash  
  # Clone the Tutorial repository to a TempTutorials folder
  git clone https://github.com/SpikySpam/Tutorials.git TempTutorials

  # Move these 3 files
  mv -f TempTutorials/SS/SS/ports.sh $TF_VAR_PATH/SS/ports.sh
  mv -f TempTutorials/SS/SS/version/docker/version.sh $TF_VAR_PATH/SS/version/docker/version.sh
  mv -f TempTutorials/SS/SS.APP/docker/vaultwarden/docker-compose.yaml $TF_VAR_PATH/SS.APP/docker/vaultwarden/docker-compose.yaml

  # Remove the TempTutorials folder
  rm -rf TempTutorials
  ```

- Be sure to copy the content from the latest [***`.bash_profile`***](../SS/.bash_profile_public) file into yours:
  ```bash
  nano $TF_VAR_PATH/.bash_profile
  ```

- Deploy it using following command
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/vaultwarden/docker-compose.yaml up
  ```

## Configure Vaultwarden

- Navigate to **https://vaultwarden.spikyspam.site/admin**
- Login with your **`$TF_VAR_VAULTWARDEN_API_KEY`**
- You can now **Invite Users**