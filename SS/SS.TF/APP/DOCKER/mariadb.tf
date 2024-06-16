resource "docker_image" "mariadb" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.MARIADB_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MARIADB}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.MARIADB_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MARIADB}"
    }
  }
}

resource "docker_container" "mariadb" {
  count   = 0
  image   = docker_image.mariadb[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.MARIADB_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.MARIADB_PORT_INT
    external = var.vars.PORTS.DATABASES.MARIADB_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.MARIADB_NAME}"
    container_path = "/var/lib/mariadb"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.MARIADB_NAME}/config/${var.vars.SECRETS.DATABASES.MARIADB_NAME}/init.sql"
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
  env = [
    "MARIADB_ROOT_PASSWORD=${var.vars.SECRETS.DATABASES.MARIADB_PASSWORD}",
    "MARIADB_USER=${var.vars.SECRETS.DATABASES.MARIADB_USER}",
    "MARIADB_PASSWORD=${var.vars.SECRETS.DATABASES.MARIADB_PASSWORD}",
    "MARIADBL_DATABASE=${var.vars.SECRETS.DATABASES.MARIADB_NAME}",
  ]
  healthcheck {
    test     = ["CMD", "healthcheck.sh", "--su-mysql", "--connect", "--innodb_initialized"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
