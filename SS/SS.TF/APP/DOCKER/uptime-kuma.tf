resource "docker_image" "uptime-kuma" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.UPTIMEKUMA_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UPTIMEKUMA}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UPTIMEKUMA}"
    }
  }
}

resource "docker_container" "uptime-kuma" {
  count   = 0
  image   = docker_image.uptime-kuma[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.UPTIMEKUMA_PORT_INT
    external = var.VARS.PORTS.TOOLS.UPTIMEKUMA_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.UPTIMEKUMA_NAME}"
    container_path = "/app/data"
  }
}
