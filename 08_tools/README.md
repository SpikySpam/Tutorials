![Tools Logo](_assets/images/tools.png)
# 08 General Tools

![Tools Banner](_assets/images/tools_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used tool like **Filebrowser**, **Kutt-IT**, **Searxng**, **Dashy**, **Uptime-Kuma** and **Listmonk**

## Video

In this video I demonstrate how to install **Filebrowser**, **Kutt-IT***, **Searxng**, **Dashy**, **Uptime-Kuma** and **Listmonk** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/tools_video.png)](https://youtu.be/XXXXXXXXXXXXX)

## Links

- [File Browser](https://filebrowser.org)
- [Kutt-IT](https://kutt.it)
- [Searxng](https://docs.searxng.org)
- [Dashy](https://dashy.to)
- [Uptime-Kuma](https://uptime.kuma.pet)
- [Listmonk](https://listmonk.app)
- 🎺 [Background Music](https://freesound.org/people/AlesiaDavina/sounds/687372/)

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward ports** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Records**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Hosts**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## [File Browser](../SS/SS.APP/docker/filebrowser/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_FILEBROWSER_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/filebrowser/docker-compose.yaml#L1-L18

## [Kutt-IT](../SS/SS.APP/docker/kutt/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KUTT_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/kutt/docker-compose.yaml#L1-L83

## [Searxng](../SS/SS.APP/docker/searxng/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SEARXNG_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/searxng/docker-compose.yaml#L1-L23

## [Dashy](../SS/SS.APP/docker/dashy/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_DASHY_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/dashy/docker-compose.yaml#L1-L15

## [Uptime-Kuma](../SS/SS.APP/docker/uptime-kuma/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_UPTIMEKUMA_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/uptime-kuma/docker-compose.yaml#L1-L11

## [Listmonk](../SS/SS.APP/docker/listmonk/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_LISTMONK_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/9ef39878c7a3e1e1e582ac2a84d7df172a8c9d3a/SS/SS.APP/docker/listmonk/docker-compose.yaml#L1-L37

## Complete Script

These are all the commands in a single script.

```bash
# FileBrowser
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_FILEBROWSER_NAME/docker-compose.yaml up -d --wait --build

# Kutt-IT
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KUTT_NAME/docker-compose.yaml up -d --wait --build

# Searxng
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SEARXNG_NAME/docker-compose.yaml up -d --wait --build

# Dashy
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_DASHY_NAME/docker-compose.yaml up -d --wait --build

# Uptime-Kuma
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_UPTIMEKUMA_NAME/docker-compose.yaml up -d --wait --build

# Listmonk
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_LISTMONK_NAME/docker-compose.yaml up -d --wait --build
```
