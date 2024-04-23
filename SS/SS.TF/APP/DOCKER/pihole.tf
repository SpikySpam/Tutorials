resource "docker_image" "pihole" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.SECURITY.PIHOLE_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PIHOLE}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.SECURITY.PIHOLE_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PIHOLE}"
    }
  }
}

resource "docker_container" "pihole" {
  count   = 0
  image   = docker_image.pihole[0].image_id
  name    = "${var.VARS.SECRETS.SECURITY.PIHOLE_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.SECURITY.PIHOLE_PORT_INT_53
    external = var.VARS.PORTS.SECURITY.PIHOLE_PORT_EXT_53
    protocol = "tcp"
  }
  ports {
    internal = var.VARS.PORTS.SECURITY.PIHOLE_PORT_INT_53
    external = var.VARS.PORTS.SECURITY.PIHOLE_PORT_EXT_53
    protocol = "udp"
  }
  ports {
    internal = var.VARS.PORTS.SECURITY.PIHOLE_PORT_INT_67
    external = var.VARS.PORTS.SECURITY.PIHOLE_PORT_EXT_67
    protocol = "udp"
  }
  ports {
    internal = var.VARS.PORTS.SECURITY.PIHOLE_PORT_INT_80
    external = var.VARS.PORTS.SECURITY.PIHOLE_PORT_EXT_80
    protocol = "tcp"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.SECURITY.PIHOLE_NAME}/data"
    container_path = "/etc/pihole"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.SECURITY.PIHOLE_NAME}/dnsmasq"
    container_path = "/etc/dnsmasq.d"
  }
  capabilities {
    add = ["NET_ADMIN"]
  }
  env = [
    "TZ=${var.VARS.SECRETS.SECURITY.PIHOLE_TZ}",
    "WEBPASSWORD=${var.VARS.SECRETS.SECURITY.PIHOLE_PASSWORD}",
  ]
  dns = [
    "127.0.0.1",
    "1.1.1.1",
  ]
}
