resource "docker_image" "hack" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.HACK.HACK_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.HACK.HACK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      DOMAIN = "${var.vars.DOMAIN}"
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "hack" {
  count   = 0
  image   = docker_image.hack[0].image_id
  name    = "${var.vars.SECRETS.HACK.HACK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = 80
    external = 80
  }
  # env = [
  #   "DISPLAY=${DISPLAY}",
  # ]
  user = "root"
  privileged = true
  stdin_open = true
  tty = true
}
