resource "docker_image" "storm-breaker" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.HACK.STORMBREAKER_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.HACK.STORMBREAKER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
    }
  }
}

resource "docker_container" "storm-breaker" {
  count   = 0
  image   = docker_image.storm-breaker[0].image_id
  name    = "${var.vars.SECRETS.HACK.STORMBREAKER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.HACK.STORMBREAKER_PORT_INT
    external = var.vars.PORTS.HACK.STORMBREAKER_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.STORMBREAKER_NAME}/images/"
    container_path = "/var/www/html/images"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.STORMBREAKER_NAME}/sounds/"
    container_path = "/var/www/html/sounds"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.STORMBREAKER_NAME}/log/"
    container_path = "/var/www/html/log"
  }
  env = [
    "USERNAME=${var.vars.SECRETS.HACK.STORMBREAKER_USER}",
    "PASSWORD=${var.vars.SECRETS.HACK.STORMBREAKER_PASSWORD}",
    "NGROK_API_KEY=${var.vars.SECRETS.HACK.STORMBREAKER_NGROK_API_KEY}",
  ]
}
