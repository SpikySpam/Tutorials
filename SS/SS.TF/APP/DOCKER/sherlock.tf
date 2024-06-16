resource "docker_image" "sherlock" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.HACK.SHERLOCK_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.HACK.SHERLOCK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
    }
  }
}

resource "docker_container" "sherlock" {
  count   = 0
  image   = docker_image.sherlock[0].image_id
  name    = "${var.vars.SECRETS.HACK.SHERLOCK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.HACK.STORMBREAKER_PORT_INT
    external = var.vars.PORTS.HACK.STORMBREAKER_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.SHERLOCK_NAME}"
    container_path = "/opt/sherlock/results"
  }
  stdin_open = true
  tty = true
}
