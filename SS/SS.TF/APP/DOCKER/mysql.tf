resource "docker_image" "mysql" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.MYSQL_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MYSQL}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MYSQL_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MYSQL}"
    }
  }
}

resource "docker_container" "mysql" {
  count   = 0
  image   = docker_image.mysql[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.MYSQL_NAME}"
  restart = "unless-stopped"
  # ports {
  #   internal = var.VARS.PORTS.DATABASES.MYSQL_PORT_INT
  #   external = var.VARS.PORTS.DATABASES.MYSQL_PORT_EXT
  # }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.MYSQL_NAME}"
    container_path = "/var/lib/mysql"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MYSQL_NAME}/config/${var.VARS.SECRETS.DATABASES.MYSQL_NAME}/init.sql"
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${var.VARS.SECRETS.DATABASES.MYSQL_PASSWORD}",
    "MYSQL_USER=${var.VARS.SECRETS.DATABASES.MYSQL_USER}",
    "MYSQL_PASSWORD=${var.VARS.SECRETS.DATABASES.MYSQL_PASSWORD}",
    "MYSQL_DATABASE=${var.VARS.SECRETS.DATABASES.MYSQL_NAME}",
  ]
  healthcheck {
    test     = ["CMD", "mysqladmin" ,"ping", "-h", "localhost"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
