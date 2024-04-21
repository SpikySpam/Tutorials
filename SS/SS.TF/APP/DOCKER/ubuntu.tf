resource "docker_image" "ubuntu" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.OS.UBUNTU_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.OS.UBUNTU_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_UBUNTU}"
    }
  }
}

resource "docker_container" "ubuntu" {
  count   = 0
  image   = docker_image.ubuntu[0].image_id
  name    = "${var.VARS.SECRETS.OS.UBUNTU_NAME}"
  restart = "unless-stopped"
  command = [
    "tail",
    "-f",
    "/dev/null",
  ]  
}
