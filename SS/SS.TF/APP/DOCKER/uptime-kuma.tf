resource "docker_image" "uptime-kuma" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.UPTIMEKUMA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UPTIMEKUMA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UPTIMEKUMA}"
    }
  }
}

resource "docker_container" "uptime-kuma" {
  count   = 0
  image   = docker_image.uptime-kuma[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.UPTIMEKUMA_PORT_INT
    external = var.vars.PORTS.TOOLS.UPTIMEKUMA_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
    container_path = "/app/data"
  }
}
