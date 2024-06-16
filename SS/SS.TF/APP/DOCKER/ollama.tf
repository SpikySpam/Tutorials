resource "docker_image" "ollama" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.AI.OLLAMA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_OLLAMA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.AI.OLLAMA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_OLLAMA}"
    }
  }
}

resource "docker_container" "ollama" {
  count   = 0
  image   = docker_image.ollama[0].image_id
  name    = "${var.vars.SECRETS.AI.OLLAMA_NAME}"
  restart = "unless-stopped"
}
