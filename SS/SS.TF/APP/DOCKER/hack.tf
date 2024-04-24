resource "docker_image" "hack" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.HACK.HACK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.HACK.HACK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      DOMAIN = "${var.VARS.DOMAIN}"
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "hack" {
  count   = 0
  image   = docker_image.hack[0].image_id
  name    = "${var.VARS.SECRETS.HACK.HACK_NAME}"
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
