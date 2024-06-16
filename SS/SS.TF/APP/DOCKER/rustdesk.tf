resource "docker_image" "rustdesk" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_RUSTDESK}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_RUSTDESK}"
    }
  }
}

resource "docker_container" "rustdesk-relay" {
  count   = 0
  image   = docker_image.rustdesk[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}-relay"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_RELAY_PORT_INT_21117
    external = var.vars.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21117
  }
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_RELAY_PORT_INT_21119
    external = var.vars.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21119
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}/relay"
    container_path = "/root"
  }
  command = [
    "hbbr",
  ]  
}

resource "docker_container" "rustdesk-signal" {
  count   = 0
  image   = docker_image.rustdesk[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}-signal"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21115
    external = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21115
  }
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21116
    external = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21116
    protocol = "tcp"
  }
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21116
    external = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21116
    protocol = "udp"
  }
  ports {
    internal = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_INT_21118
    external = var.vars.PORTS.TOOLS.RUSTDESK_SIGNAL_PORT_EXT_21118
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}/signal"
    container_path = "/root"
  }
  command = [
    "hbbs",
    "-r",
    "${var.vars.SECRETS.TOOLS.RUSTDESK_NAME}.${var.vars.DOMAIN}:${var.vars.PORTS.TOOLS.RUSTDESK_RELAY_PORT_EXT_21117}",
  ]  
}
