resource "docker_image" "papercut" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.NETWORK.PAPERCUT_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PAPERCUT}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.NETWORK.PAPERCUT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PAPERCUT}"
    }
  }
}

resource "docker_container" "papercut" {
  count   = 0
  image   = docker_image.papercut[0].image_id
  name    = "${var.VARS.SECRETS.NETWORK.PAPERCUT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.NETWORK.PAPERCUT_PORT_INT_GUI
    external = var.VARS.PORTS.NETWORK.PAPERCUT_PORT_EXT_GUI
  }
  ports {
    internal = var.VARS.PORTS.NETWORK.PAPERCUT_PORT_INT_SMTP
    external = var.VARS.PORTS.NETWORK.PAPERCUT_PORT_EXT_SMTP
  }
}
