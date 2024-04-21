resource "docker_image" "puter" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.OS.PUTER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PUTER}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.OS.PUTER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "puter" {
  count   = 0
  image   = docker_image.puter[0].image_id
  name    = "${var.VARS.SECRETS.OS.PUTER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.OS.PUTER_PORT_INT
    external = var.VARS.PORTS.OS.PUTER_PORT_EXT
  }
  # volumes {
  #   host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.OS.PUTER_NAME}/config.json"
  #   container_path = "/config/config.json"
  # }
  command = [
    "npm",
    "start",
  ]  
}
