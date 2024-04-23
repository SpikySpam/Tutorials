resource "docker_image" "mariadb" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.MARIADB_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MARIADB}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MARIADB_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MARIADB}"
    }
  }
}

resource "docker_container" "mariadb" {
  count   = 0
  image   = docker_image.mariadb[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.MARIADB_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.MARIADB_PORT_INT
    external = var.VARS.PORTS.DATABASES.MARIADB_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.MARIADB_NAME}"
    container_path = "/var/lib/mariadb"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MARIADB_NAME}/config/${var.VARS.SECRETS.DATABASES.MARIADB_NAME}/init.sql"
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
  env = [
    "MARIADB_ROOT_PASSWORD=${var.VARS.SECRETS.DATABASES.MARIADB_PASSWORD}",
    "MARIADB_USER=${var.VARS.SECRETS.DATABASES.MARIADB_USER}",
    "MARIADB_PASSWORD=${var.VARS.SECRETS.DATABASES.MARIADB_PASSWORD}",
    "MARIADBL_DATABASE=${var.VARS.SECRETS.DATABASES.MARIADB_NAME}",
  ]
  healthcheck {
    test     = ["CMD", "healthcheck.sh", "--su-mysql", "--connect", "--innodb_initialized"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
