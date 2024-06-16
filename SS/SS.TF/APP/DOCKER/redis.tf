resource "docker_image" "redis" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.REDIS_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_REDIS}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.REDIS_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_REDIS}"
    }
  }
}

resource "docker_container" "redis" {
  count   = 0
  image   = docker_image.redis[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.REDIS_NAME}"
  restart = "unless-stopped"
  # ports {
  #   internal = var.vars.PORTS.DATABASES.REDIS_PORT_INT
  #   external = var.vars.PORTS.DATABASES.REDIS_PORT_EXT
  # }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.REDIS_NAME}"
    container_path = "/data"
  }
  command = [
    "redis-server",
    "--save 20 1",
    "--loglevel warning ",
  ]
  healthcheck {
    test     = [ "CMD", "redis-cli", "--raw", "incr", "ping" ]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
