resource "docker_image" "ubuntu" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.OS.UBUNTU_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.OS.UBUNTU_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "ubuntu" {
  count   = 0
  image   = docker_image.ubuntu[0].image_id
  name    = "${var.vars.SECRETS.OS.UBUNTU_NAME}"
  restart = "unless-stopped"
  command = [
    "tail",
    "-f",
    "/dev/null",
  ]  
}
