resource "docker_image" "storm-breaker" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PYTHON}"
    }
  }
}

resource "docker_container" "storm-breaker" {
  count   = 0
  image   = docker_image.storm-breaker[0].image_id
  name    = "${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.HACK.STORMBREAKER_PORT_INT
    external = var.VARS.PORTS.HACK.STORMBREAKER_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}/images/"
    container_path = "/var/www/html/images"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}/sounds/"
    container_path = "/var/www/html/sounds"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.HACK.STORMBREAKER_NAME}/log/"
    container_path = "/var/www/html/log"
  }
  env = [
    "USERNAME=${var.VARS.SECRETS.HACK.STORMBREAKER_USER}",
    "PASSWORD=${var.VARS.SECRETS.HACK.STORMBREAKER_PASSWORD}",
    "NGROK_API_KEY=${var.VARS.SECRETS.HACK.STORMBREAKER_NGROK_API_KEY}",
  ]
}
