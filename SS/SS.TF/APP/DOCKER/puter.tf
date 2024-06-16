resource "docker_image" "puter" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.OS.PUTER_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PUTER}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.OS.PUTER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "puter" {
  count   = 0
  image   = docker_image.puter[0].image_id
  name    = "${var.vars.SECRETS.OS.PUTER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.OS.PUTER_PORT_INT
    external = var.vars.PORTS.OS.PUTER_PORT_EXT
  }
  # volumes {
  #   host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.OS.PUTER_NAME}/config.json"
  #   container_path = "/config/config.json"
  # }
  command = [
    "npm",
    "start",
  ]  
}
