resource "docker_image" "ollama" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.AI.OLLAMA_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_OLLAMA}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.AI.OLLAMA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_OLLAMA}"
    }
  }
}

resource "docker_container" "ollama" {
  count   = 0
  image   = docker_image.ollama[0].image_id
  name    = "${var.VARS.SECRETS.AI.OLLAMA_NAME}"
  restart = "unless-stopped"
}
