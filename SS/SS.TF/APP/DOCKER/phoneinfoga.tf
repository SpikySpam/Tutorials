resource "docker_image" "phoneinfoga" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.HACK.PHONEINFOGA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PHONEINFOGA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.HACK.PHONEINFOGA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PHONEINFOGA}"
    }
  }
}

resource "docker_container" "phoneinfoga" {
  count   = 0
  image   = docker_image.phoneinfoga[0].image_id
  name    = "${var.vars.SECRETS.HACK.PHONEINFOGA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.HACK.PHONEINFOGA_PORT_INT
    external = var.vars.PORTS.HACK.PHONEINFOGA_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.PHONEINFOGA_NAME}"
    container_path = "/opt/sherlock/results"
  }
  env = [
    "NUMVERIFY_API_KEY=${var.vars.SECRETS.HACK.PHONEINFOGA_NUMVERIFY_API_KEY}",
    "GOOGLE_API_KEY=${var.vars.SECRETS.HACK.PHONEINFOGA_GOOGLE_API_KEY}",
    "GOOGLECSE_CX=${var.vars.SECRETS.HACK.PHONEINFOGA_GOOGLE_CSE_CX}",
    "GOOGLECSE_MAX_RESULTS=10",
  ]
  command = [
    "serve",
  ]
}
