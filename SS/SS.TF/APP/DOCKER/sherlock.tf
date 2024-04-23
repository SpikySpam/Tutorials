resource "docker_image" "sherlock" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.HACK.SHERLOCK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.HACK.SHERLOCK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
    }
  }
}

resource "docker_container" "sherlock" {
  count   = 0
  image   = docker_image.sherlock[0].image_id
  name    = "${var.VARS.SECRETS.HACK.SHERLOCK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.HACK.STORMBREAKER_PORT_INT
    external = var.VARS.PORTS.HACK.STORMBREAKER_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.HACK.SHERLOCK_NAME}"
    container_path = "/opt/sherlock/results"
  }
  stdin_open = true
  tty = true
}
