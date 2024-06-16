resource "docker_image" "phpmyadmin" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.PHPMYADMIN_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PHPMYADMIN}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.PHPMYADMIN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PHPMYADMIN}"
    }
  }
}

resource "docker_container" "phpmyadmin" {
  count   = 0
  image   = docker_image.phpmyadmin[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.PHPMYADMIN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.PHPMYADMIN_PORT_INT
    external = var.vars.PORTS.DATABASES.PHPMYADMIN_PORT_EXT
  }
  env = [
    "PMA_ARBITRARY=1",
  ]
}
