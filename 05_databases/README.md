![DB Logo](_assets/images/database.png)
# 05. Databases

![DB Banner](_assets/images/db_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used databases like **PostgreSQL**, **MySql**, **MariaDB**, **Redis**, **Prometheus** and **Elastic Search**. We will use those databases in a lot of upcoming Tutorials. We will also install the **pgAdmin**, **phpMyAdmin**, **Grafana** and **Kibana** tools to have a graphical web interface.

## Video

In this video I demonstrate how to install **PostgreSQL**, **MySql**, **MariaDB**, **Redis**, **Prometheus** and **Elastic Search** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/db_video.png)](https://youtu.be/8UoNDwNV4R8)

## Links

- [PostgreSQL](https://www.postgresql.org)
- ➡️ [pgAdmin](https://www.pgadmin.org)
- [MySql](https://www.mysql.com)
- [MariaDB](https://mariadb.org/)
- ➡️ [phpMyAdmin](https://www.phpmyadmin.net)
- [Redis](https://redis.com)
- [Prometheus](https://prometheus.io)
- ➡️ [Grafana](https://grafana.com)
- [Elastic Search](https://www.elastic.co)
- ➡️ [Kibana](https://www.elastic.co/kibana)
- 🎺 [Background Music](https://freesound.org/people/gis_sweden/sounds/514508)

## Prerequisites

- [04. Mail-in-a-Box](../04_mail_in_a_box/README.md)
  - Its **prerequisites**
  - Its **addendum**

## Clone latest Sources
<a id="latest-sources"></a>
- **Login** into your [Ubuntu VM](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) in [ProxMox](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)
- Get the latest **Sources** from **GitHub**:
  ```bash
  # Clone to Temporary folder
  rm -rf SpikySpamTutorials
  git clone https://github.com/SpikySpam/Tutorials.git SpikySpamTutorials
 
  # Remove old folder & Copy Temp folder
  rm -fr $TF_VAR_PATH
  mv -f SpikySpamTutorials/SS $TF_VAR_PATH
  rm -rf SpikySpamTutorials
  ```
- Check new **[.bash_profile.sh](../SS/.bash_profile)**
  ```bash  
  nano $TF_VAR_PATH/.bash_profile
  ```
- Check new **[ports.sh](../SS/SS/ports.sh)**

  https://github.com/SpikySpam/Tutorials/blob/6c2f4e44317764a4db9ecbf57fa0bfad8ded7a02/SS/SS/ports.sh#L1-L96

- Check new **[version.sh](../SS/SS/version/docker/version.sh)**

  https://github.com/SpikySpam/Tutorials/blob/6c2f4e44317764a4db9ecbf57fa0bfad8ded7a02/SS/SS/version/docker/version.sh#L1-L42

## [PostgreSQL](../SS/SS.APP/docker/postgres/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_POSTGRES_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/a434c024da9ccc33ac165585dab0818f8b3c8f8d/SS/SS.APP/docker/postgres/docker-compose.yaml#L1-L15

- Web Interface
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PGADMIN_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/a434c024da9ccc33ac165585dab0818f8b3c8f8d/SS/SS.APP/docker/pgadmin/docker-compose.yaml#L1-L16

## [MySql](../SS/SS.APP/docker/mysql/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/mysql/docker-compose.yaml#L1-L17

- Web Interface
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHPMYADMIN_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/phpmyadmin/docker-compose.yaml#L1-L11

## [MariaDB](../SS/SS.APP/docker/mariadb/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MARIADB_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/mariadb/docker-compose.yaml#L1-L17

## [Redis](../SS/SS.APP/docker/redis/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_REDIS_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/redis/docker-compose.yaml#L1-L13

## [Prometheus](../SS/SS.APP/docker/prometheus/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PROMETHEUS_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/prometheus/docker-compose.yaml#L1-L14

- Web Interface
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GRAFANA_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/grafana/docker-compose.yaml#L1-L15

## [Elastic Search](../SS/SS.APP/docker/elasticsearch/docker-compose.yaml)

- Database
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/elasticsearch/docker-compose.yaml#L1-L22

- Web Interface
  ```bash
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KIBANA_NAME/docker-compose.yaml up -d --wait --build
  ```

  https://github.com/SpikySpam/Tutorials/blob/4e680405ee5a35fbf4fccc0b2acd6c1ed4c199ad/SS/SS.APP/docker/kibana/docker-compose.yaml#L1-L14

## Complete Script

These are all the above commands in a single script:

- Database
  ```bash
  # PostgreSQL
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_POSTGRES_NAME/docker-compose.yaml up -d --wait --build

  # MySql
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml up -d --wait --build

  # MariaDB
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MARIADB_NAME/docker-compose.yaml up -d --wait --build

  # Redis
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_REDIS_NAME/docker-compose.yaml up -d --wait --build

  # Prometheus
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PROMETHEUS_NAME/docker-compose.yaml up -d --wait --build

  # Elastic Search
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml up -d --wait --build
  ```

- Web Interface
  ```bash
  # pgAdmin ➡️ PostgreSQL
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PGADMIN_NAME/docker-compose.yaml up -d --wait --build

  # phpMyAdmin ➡️ MySql, MariaDB, ...
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHPMYADMIN_NAME/docker-compose.yaml up -d --wait --build

  # Grafana ➡️ Prometheus
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_GRAFANA_NAME/docker-compose.yaml up -d --wait --build

  # Kibana ➡️ Elastic Search
  $TF_VAR_COT compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_KIBANA_NAME/docker-compose.yaml up -d --wait --build
  ```

## Check Docker

- Get **Ownership** of the mounted Docker volume folder (*for **Elastic Search***):
  ```bash  
  sudo chown -R spikyspam:spikyspam $HOME/docker
  ```

- **Check** Containers
  ```bash
  docker ps
  ```

- **Clean** Docker (**skip this**)
  ```bash
  # docker rm -f $(docker ps -a -q)
  # docker system prune -a -f
  # sudo rm -rf $HOME/docker
  ```

## 1️⃣ Forward ports on your Router.
<a id="forward-ports-router"></a>
  - Add the following port-forward rules:
    ```
    192.168.0.30 ➡️ 5433 # TF_VAR_PGADMIN_PORT_EXT
    192.168.0.30 ➡️ 3307 # TF_VAR_PHPMYADMIN_PORT_EXT
    192.168.0.30 ➡️ 3002 # TF_VAR_GRAFANA_PORT_EXT
    192.168.0.30 ➡️ 5601 # TF_VAR_KIBANA_PORT_EXT
    ```
  - We've created the IP address **192.168.0.30** in [018. ProxMox ➡️ Ubuntu](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)

## 2️⃣ Add A-Records
<a id="add-a-record"></a>

- Browse to your [04. Mail-in-a-Box](../04_mail_in_a_box/README.md) address.
- Navigate to **Custom DNS** in the **System** menu
- Create 4 A-records:
  - A1:
    - **Name**: pgadmin
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**
  - A2:
    - **Name**: phpmyadmin
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**
  - A3:
    - **Name**: grafana
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**
  - A4:
    - **Name**: kibana
    - **Type**: A
    - **Value**: 46.101.80.89
    - Click **Set Record**

## 3️⃣ Setup NPM Proxy Hosts
<a id="npm-proxy-host"></a>

- Navigate to your [03. Nginx Proxy Manager](../03_nginx_proxy_manager/README.md) address.
- Add 4 Proxy Hosts:
  - Host 1:
    - **Domain Names**: 
      - pgadmin.spikyspam.site ➡️ ***`TF_VAR_PGADMIN_NAME`***
    - **Scheme**: http
    - **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
    - **Port**: 5433 ➡️ ***`TF_VAR_PGADMIN_PORT_EXT`***
    - Block Common Exploits
    - Websockets Support
    - **SSL**:
      - Let's Encrypt
      - Force SSL
  - Host 2:
    - **Domain Names**: 
      - phpmyadmin.spikyspam.site ➡️ ***`TF_VAR_PHPMYADMIN_NAME`***
    - **Scheme**: http
    - **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
    - **Port**: 3307 ➡️ ***`TF_VAR_PHPMYADMIN_PORT_EXT`***
    - Block Common Exploits
    - Websockets Support
    - **SSL**:
      - Let's Encrypt
      - Force SSL
  - Host 3:
    - **Domain Names**: 
      - grafana.spikyspam.site ➡️ ***`TF_VAR_GRAFANA_NAME`***
    - **Scheme**: http
    - **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
    - **Port**: 3002 ➡️ ***`TF_VAR_GRAFANA_PORT_EXT`***
    - Block Common Exploits
    - Websockets Support
    - **SSL**:
      - Let's Encrypt
      - Force SSL
  - Host 4:
    - **Domain Names**: 
      - kibana.spikyspam.site ➡️ ***`TF_VAR_KIBANA_NAME`***
    - **Scheme**: http
    - **Forward IP**: ***`[YOUR_HOME_WAN_IP]`***
    - **Port**: 5601 ➡️ ***`TF_VAR_KIBANA_PORT_EXT`***
    - Block Common Exploits
    - Websockets Support
    - **SSL**:
      - Let's Encrypt
      - Force SSL
