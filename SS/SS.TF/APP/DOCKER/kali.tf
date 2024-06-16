resource "docker_image" "kali" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.OS.KALI_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KALI}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.OS.KALI_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KALI}"
    }
  }
}

resource "docker_container" "kali" {
  count   = 0
  image   = docker_image.kali[0].image_id
  name    = "${var.vars.SECRETS.OS.KALI_NAME}"
  restart = "unless-stopped"
  command = [
    "tail",
    "-f",
    "/dev/null",
  ]  
}
