![Development Logo](_assets/images/development.png)
# 10. Development

![Development Banner](_assets/images/development_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used development tool like **RabbitMQ**, **Harbor**, **Gitlab** and **Code Server**.

## Video

In this video I demonstrate how to install **RabbitMQ**, **Harbor**, **Gitlab** and **Code Server** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/development_video.png)](https://youtu.be/XXXXXXXXXXXXX)

## Links

- [RabbitMQ](https://rabbitmq.com)
- [Harbor](https://bitnami.com/stack/harbor)
- [Gitlab](https://gitlab.com)
- [Code Server](https://gitlab.com)

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward all ports** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Records**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Hosts**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## Complete Script

These are all the commands in a single script.
  ```bash
  # RabbitMQ
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_RABBITMQ_NAME/docker-compose.yaml up -d

  # Harbor
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HARBOR_NAME/docker-compose.yaml up -d

  # Gitlab
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GITLAB_NAME/docker-compose.yaml up -d
  ```

## Check Docker

- **Check** Containers
  ```bash
  docker ps
  ```
