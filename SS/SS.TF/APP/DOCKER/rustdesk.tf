resource "docker_image" "rustdesk" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_RUSTDESK}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_RUSTDESK}"
    }
  }
}

resource "docker_container" "rustdesk-relay" {
  count   = 0
  image   = docker_image.rustdesk[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}-relay"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_RELAY_PORT_INT_21117
    external = var.VARS.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21117
  }
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_RELAY_PORT_INT_21119
    external = var.VARS.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21119
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}/relay"
    container_path = "/root"
  }
  command = [
    "hbbr",
  ]  
}

resource "docker_container" "rustdesk-signal" {
  count   = 0
  image   = docker_image.rustdesk[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}-signal"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21115
    external = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21115
  }
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21116
    external = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21116
    protocol = "tcp"
  }
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21116
    external = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21116
    protocol = "udp"
  }
  ports {
    internal = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21118
    external = var.VARS.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21118
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}/signal"
    container_path = "/root"
  }
  command = [
    "hbbs",
    "-r",
    "${var.VARS.SECRETS.TOOLS.RUSTDESK_NAME}.${var.VARS.DOMAIN}:${var.VARS.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21117}",
  ]  
}
