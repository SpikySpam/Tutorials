resource "docker_image" "pgadmin" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.PGADMIN_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PGADMIN}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.PGADMIN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PGADMIN}"
    }
  }
}

resource "docker_container" "pgadmin" {
  count   = 0
  image   = docker_image.pgadmin[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.PGADMIN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.PGADMIN_PORT_INT
    external = var.VARS.PORTS.DATABASES.PGADMIN_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.PGADMIN_NAME}"
    container_path = "/var/lib/pgadmin"
  }
  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.VARS.SECRETS.DATABASES.PGADMIN_USER}",
    "PGADMIN_DEFAULT_PASSWORD=${var.VARS.SECRETS.DATABASES.PGADMIN_PASSWORD}",
    "PGADMIN_CONFIG_SERVER_MODE=True",
  ]
  user = "root"
}
