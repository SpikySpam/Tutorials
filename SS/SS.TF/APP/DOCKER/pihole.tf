resource "docker_image" "pihole" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.SECURITY.PIHOLE_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PIHOLE}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.PIHOLE_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PIHOLE}"
    }
  }
}

resource "docker_container" "pihole" {
  count   = 0
  image   = docker_image.pihole[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.PIHOLE_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.SECURITY.PIHOLE_PORT_INT_53
    external = var.vars.PORTS.SECURITY.PIHOLE_PORT_EXT_53
    protocol = "tcp"
  }
  ports {
    internal = var.vars.PORTS.SECURITY.PIHOLE_PORT_INT_53
    external = var.vars.PORTS.SECURITY.PIHOLE_PORT_EXT_53
    protocol = "udp"
  }
  ports {
    internal = var.vars.PORTS.SECURITY.PIHOLE_PORT_INT_67
    external = var.vars.PORTS.SECURITY.PIHOLE_PORT_EXT_67
    protocol = "udp"
  }
  ports {
    internal = var.vars.PORTS.SECURITY.PIHOLE_PORT_INT_80
    external = var.vars.PORTS.SECURITY.PIHOLE_PORT_EXT_80
    protocol = "tcp"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.PIHOLE_NAME}/data"
    container_path = "/etc/pihole"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.PIHOLE_NAME}/dnsmasq"
    container_path = "/etc/dnsmasq.d"
  }
  capabilities {
    add = ["NET_ADMIN"]
  }
  env = [
    "TZ=${var.vars.SECRETS.SECURITY.PIHOLE_TZ}",
    "WEBPASSWORD=${var.vars.SECRETS.SECURITY.PIHOLE_PASSWORD}",
  ]
  dns = [
    "127.0.0.1",
    "1.1.1.1",
  ]
}
