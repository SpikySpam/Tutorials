resource "docker_image" "softether" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.HACK.SOFTETHER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_SOFTETHER}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.HACK.SOFTETHER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      UBUNTU_VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}",
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_SOFTETHER}"
    }
  }
}

resource "docker_container" "softether" {
  count   = 0
  image   = docker_image.softether[0].image_id
  name    = "${var.VARS.SECRETS.HACK.SOFTETHER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_443
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_443
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_5555
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_5555
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_992
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_992
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_500
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_500
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_4500
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_4500
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_1701
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_1701
  }
  ports {
    internal = var.VARS.PORTS.HACK.SOFTETHER_PORT_INT_1194
    external = var.VARS.PORTS.HACK.SOFTETHER_PORT_EXT_1194
  }
}
