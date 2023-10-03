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
- [Beef Project](https://beefproject.com)
- [Sherlock](https://sherlock-project.github.io)
- Hacking Tools
- 🎺 [Background Music](https://freesound.org/people/XXXXXXXXXXXX)

## Prerequisites

[![05. Databases](../05_databases/_assets/images/database.png)](../05_databases/README.md)

## Network Preparations

These steps are explained in this **[video](https://youtu.be/8UoNDwNV4R8)**:

1️⃣ [**Forward ports** on your **Router**](../05_databases/README.md#forward-ports-router) \
2️⃣ [Add **A-Records**](../05_databases/README.md#add-a-record) \
3️⃣ [Add NPM **Proxy Hosts**](../05_databases/README.md#npm-proxy-host) \
4️⃣ [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)

## [Phone Info GA](../SS/SS.APP/docker/phoneinfoga/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHONEINFOGA_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/phoneinfoga/docker-compose.yaml#L1-L16

## [Storm Breaker](../SS/SS.APP/docker/storm-breaker/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_STORMBREAKER_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/storm-breaker/docker-compose.yaml#L1-L21

## [Softether](../SS/SS.APP/docker/softether/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SOFTETHER_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/softether/docker-compose.yaml#L1-L19

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/softether/dockerfile#L1-L14

## [Beef Project](../SS/SS.APP/docker/beef/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_BEEF_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/beef/docker-compose.yaml#L1-L42

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/beef/dockerfile#L1-L16

## [Sherlock](../SS/SS.APP/docker/sherlock/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/sherlock/docker-compose.yaml#L1-L15

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/sherlock/dockerfile#L1-L13

## [Hacking Tools](../SS/SS.APP/docker/hack/docker-compose.yaml)

```bash
$TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HACK_NAME/docker-compose.yaml up -d --wait --build
```

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/hack/docker-compose.yaml#L1-L20

https://github.com/SpikySpam/Tutorials/blob/96c4eceb95fcce99f6db58eb9ec72aa267fa11fb/SS/SS.APP/docker/hack/dockerfile#L1-L7

## Complete Script

These are all the commands in a single script:

- Web Interface
  ```bash
  # Phone Info GA
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHONEINFOGA_NAME/docker-compose.yaml up -d --wait --build

  # Storm Breaker
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_STORMBREAKER_NAME/docker-compose.yaml up -d --wait --build

  # Softether
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SOFTETHER_NAME/docker-compose.yaml up -d --wait --build

  # Beef Project
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_BEEF_NAME/docker-compose.yaml up -d --wait --build
  ```

- CLI Tools
  ```bash
  # Sherlock
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_SHERLOCK_NAME/docker-compose.yaml up -d --wait --build

  # Hacking Tools
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_HACK_NAME/docker-compose.yaml up -d --wait --build
  ```

