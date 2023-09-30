![Hack Logo](_assets/images/hack.png)
# 11. Hack

![Hack Banner](_assets/images/hack_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used development tool like **Phone Info GA**, **Sherlock**, **Storm Breaker**, **Softether**, **Beef** and **Hacking Tool**.

## Video

In this video I demonstrate how to install **Phone Info GA**, **Sherlock**, **Storm Breaker**, **Softether** and **Beef** and **Hacking Tool** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/development_video.png)](https://youtu.be/XXXXXXXXXXXXX)

## Links

- [Phone Info GA](https://sundowndev.github.io/phoneinfoga)
- [Storm Breaker](https://github.com/ultrasecurity/Storm-Breaker)
- [Softether](https://softether.org)
- [Beef Project](https://beefproject.com/)
- [Sherlock](https://sherlock-project.github.io)
- Hacking Tools

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward all ports** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Records**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Hosts**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## Complete Script

These are all the commands in a single script:

- Web Interface
  ```bash
  # Phone Info GA
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHONEINFOGA_NAME/docker-compose.yaml up -d

  # Storm Breaker
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_STORMBREAKER_NAME/docker-compose.yaml up -d

  # Softether
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SOFTETHER_NAME/docker-compose.yaml up -d

  # Beef Project
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_BEEF_NAME/docker-compose.yaml up -d
  ```

- CLI Tools
  ```bash
  # Sherlock
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml up -d

  # Hacking Tools
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HACK_NAME/docker-compose.yaml up -d
  ```

## Check Docker

- **Check** Containers
  ```bash
  docker ps
  ```
