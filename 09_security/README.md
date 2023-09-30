![Security Logo](_assets/images/security.png)
# 09. Security

![Security Banner](_assets/images/security_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used security tool like **Keycloak**, **Guacamole** and **Twingate**

## Video

In this video I demonstrate how to install **Keycloak**, **Guacamole** and **Twingate** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/security_video.png)](https://youtu.be/XXXXXXXXXXXXX)

## Links

- [Keycloak](https://keycloak.org)
- [Guacamole](https://guacamole.apache.org)
- [Twingate](https://twingate.com)
- 🎺 [Background Music](https://freesound.org/people/XXXXXXXXXXXX)

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward ports** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Records**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Hosts**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## [Keycloak](../SS/SS.APP/docker/keycoak/docker-compose.yaml)

```bash
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KEYCLOAK_NAME/docker-compose.yaml up -d
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/keycloak/docker-compose.yaml#L1-L40

## [Guacamole](../SS/SS.APP/docker/guacamole/docker-compose.yaml)

```bash
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GUACAMOLE_NAME/docker-compose.yaml up -d
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/guacamole/docker-compose.yaml#L1-L59

## [Twingate](../SS/SS.APP/docker/twingate/docker-compose.yaml)

```bash
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_TWINGATE_NAME/docker-compose.yaml up -d
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/twingate/docker-compose.yaml#L1-L14

## Complete Script

These are all the commands in a single script.

```bash
# Keycloak
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KEYCLOAK_NAME/docker-compose.yaml up -d

# Guacamole
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GUACAMOLE_NAME/docker-compose.yaml up -d

# Twingate
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_TWINGATE_NAME/docker-compose.yaml up -d
```

