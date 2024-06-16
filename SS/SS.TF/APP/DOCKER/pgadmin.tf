resource "docker_image" "pgadmin" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.PGADMIN_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PGADMIN}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.PGADMIN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PGADMIN}"
    }
  }
}

resource "docker_container" "pgadmin" {
  count   = 0
  image   = docker_image.pgadmin[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.PGADMIN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.PGADMIN_PORT_INT
    external = var.vars.PORTS.DATABASES.PGADMIN_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.PGADMIN_NAME}"
    container_path = "/var/lib/pgadmin"
  }
  env = [
    "PGADMIN_DEFAULT_EMAIL=${var.vars.SECRETS.DATABASES.PGADMIN_USER}",
    "PGADMIN_DEFAULT_PASSWORD=${var.vars.SECRETS.DATABASES.PGADMIN_PASSWORD}",
    "PGADMIN_CONFIG_SERVER_MODE=True",
  ]
  user = "root"
}
