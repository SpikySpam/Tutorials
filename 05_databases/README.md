![DB Logo](_assets/images/database.png)
# 05. Databases

![DB Banner](_assets/images/db_banner.png)

In this Tutorial we are going to prepare some **Docker** compose files for a couple of the frequently used databases like **PostgreSQL**, **MySql**, **Redis**, **Prometheus**, and **Elastic Search**. We will use those databases in a lot of upcoming Tutorials.

## Video

In this video I demonstrate how to install **PostgreSQL**, **MySql**, **Redis**, **Prometheus**, and **Elastic Search** on a [Ubuntu Virtual Machine](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) (*in ProxMox*) inside a **Docker** container.

[![Video](_assets/images/db-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXX)

## Links

- [PostgreSQL Site](https://www.postgresql.org)
- [pgAdmin Site](https://www.pgadmin.org)
- [MySql Site](https://www.mysql.com)
- [phpMyAdmin Site](https://www.phpmyadmin.net)
- [Redis Site](https://redis.com)
- [Prometheus Site](https://prometheus.io)
- [Elastic Search Site](https://www.elastic.co)

## Prerequisites

- [04. Mail-in-a-Box](../04_mail_in_a_box/README.md)
  - Its **prerequisites**
  - Its **addendum**

## Clone latest Sources

- **Login** into your [Ubuntu VM](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md) in [ProxMox](../01_setting_up_a_cheap_home_lab_with_proxmox/018_ubuntu/README.md)
- Get the latest **Sources** from **GitHub**:
  ```bash  
  rm -rf SpikySpamTutorials  
  git clone https://github.com/SpikySpam/Tutorials.git SpikySpamTutorials
 
  # mkdir $HOME/Desktop/Tutorials
  rm -fr $TF_VAR_PATH
  mv -f SpikySpamTutorials/SS $TF_VAR_PATH
  rm -rf SpikySpamTutorials
  ```
- Get the latest [***`.bash_profile`***](../SS/.bash_profile_public) content:
  ```bash  
  cp $TF_VAR_PATH/.bash_profile_public $TF_VAR_PATH/.bash_profile
  ```
- Check new **[ports.sh](../SS/SS/ports.sh)**
  ```bash  
  nano $TF_VAR_PATH_MAIN/ports.sh
  ```
- Check new **[version.sh](../SS/SS/version/docker/version.sh)**
  ```bash  
  nano $TF_VAR_PATH_MAIN/version/docker/version.sh
  ```

### [PostgreSQL](../SS/SS.APP/docker/postgres/docker-compose.yaml)

- Database
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_POSTGRES_NAME/docker-compose.yaml up -d
  ```
- Web Interface
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PGADMIN_NAME/docker-compose.yaml up -d
  ```

### [MySql](../SS/SS.APP/docker/mysql/docker-compose.yaml)

- Database
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml up -d
  ```
- Web Interface
  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHPMYADMIN_NAME/docker-compose.yaml up -d
  ```

### [Redis](../SS/SS.APP/docker/redis/docker-compose.yaml)

  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_REDIS_NAME/docker-compose.yaml up -d
  ```

### [Prometheus](../SS/SS.APP/docker/prometheus/docker-compose.yaml)

  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PROMETHEUS_NAME/docker-compose.yaml up -d
  ```

### [Elastic Search](../SS/SS.APP/docker/elasticsearch/docker-compose.yaml)

  ```bash
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml up -d
  ```

## Complete Script

These are all the above commands in a single script.
  ```bash
  # PostgreSQL
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_POSTGRES_NAME/docker-compose.yaml up -d
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PGADMIN_NAME/docker-compose.yaml up -d

  # MySql
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_MYSQL_NAME/docker-compose.yaml up -d
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PHPMYADMIN_NAME/docker-compose.yaml up -d

  # Redis
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_REDIS_NAME/docker-compose.yaml up -d

  # Prometheus
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_PROMETHEUS_NAME/docker-compose.yaml up -d

  # Elastic Search
  docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_ELASTICSEARCH_NAME/docker-compose.yaml up -d
  ```

## Check

- Get **Ownership** of the mounted Docker volume folder (*for **Elastix Search***):
  ```bash  
  sudo chown -R spikyspam:spikyspam $HOME/docker
  ```

- **Check** Containers
  ```bash
  docker ps
  ```

- **Clean** Docker
  ```bash
  docker rm -f $(docker ps -a -q)
  docker system prune -a -f
  sudo rm -rf $HOME/docker
  ```
