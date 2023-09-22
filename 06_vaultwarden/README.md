![NPM Logo](_assets/images/vaultwarden.png)
# 06. Vaultwarden

![NPM Banner](_assets/images/bw_banner.png)

In this Tutorial we are going to setup **Vaultwarden** as our **Password Manager**

## Video

In this video I demonstrate how to install **Vaultwarden** on a Ubuntu Virtual Machine (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/vaultwarden-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXX)

## Links

- [Bitwarden Site](https://bitwarden.com)
- [Vaultwarden Github](https://github.com/dani-garcia/vaultwarden)

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward port 7000** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Record**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Host**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## Install Vaultwarden

- Create a **[Vaultwarden Hash](https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page)** for the ***$TF_VAR_VAULTWARDEN_ADMIN_TOKEN*** environment variable (*based on the **$TF_VAR_VAULTWARDEN_ADMIN_PASSWORD** environment variable*)
  ```bash
  # Strong Password
  nano $TF_VAR_PATH/.bash_profile
  echo $TF_VAR_VAULTWARDEN_ADMIN_PASSWORD

  # Get Hash
  docker run --rm -it vaultwarden/server:${TF_VAR_VERSION_DOCKER_VAULTWARDEN} ./vaultwarden hash
  ```
- **Install** Vaultwarden
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_VAULTWARDEN_NAME/docker-compose.yaml up -d
  ```

## Configure Vaultwarden

- Navigate to **https://vaultwarden.spikyspam.site/admin**
- Login with your **`$TF_VAR_VAULTWARDEN_ADMIN_PASSWORD`**
- You can now **Invite Users**