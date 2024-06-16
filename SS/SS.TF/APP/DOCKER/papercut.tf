resource "docker_image" "papercut" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.NETWORK.PAPERCUT_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PAPERCUT}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.NETWORK.PAPERCUT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PAPERCUT}"
    }
  }
}

resource "docker_container" "papercut" {
  count   = 0
  image   = docker_image.papercut[0].image_id
  name    = "${var.vars.SECRETS.NETWORK.PAPERCUT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.NETWORK.PAPERCUT_PORT_INT_GUI
    external = var.vars.PORTS.NETWORK.PAPERCUT_PORT_EXT_GUI
  }
  ports {
    internal = var.vars.PORTS.NETWORK.PAPERCUT_PORT_INT_SMTP
    external = var.vars.PORTS.NETWORK.PAPERCUT_PORT_EXT_SMTP
  }
}
