resource "docker_image" "kali" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.OS.KALI_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KALI}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.OS.KALI_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KALI}"
    }
  }
}

resource "docker_container" "kali" {
  count   = 0
  image   = docker_image.kali[0].image_id
  name    = "${var.VARS.SECRETS.OS.KALI_NAME}"
  restart = "unless-stopped"
  command = [
    "tail",
    "-f",
    "/dev/null",
  ]  
}
