resource "docker_image" "phpmyadmin" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.PHPMYADMIN_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PHPMYADMIN}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.PHPMYADMIN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PHPMYADMIN}"
    }
  }
}

resource "docker_container" "phpmyadmin" {
  count   = 0
  image   = docker_image.phpmyadmin[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.PHPMYADMIN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.PHPMYADMIN_PORT_INT
    external = var.VARS.PORTS.DATABASES.PHPMYADMIN_PORT_EXT
  }
  env = [
    "PMA_ARBITRARY=1",
  ]
}
