resource "docker_image" "redis" {
  count = 1
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.REDIS_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_REDIS}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_REDIS}"
    }
  }
}

resource "docker_container" "redis" {
  count   = 0
  image   = docker_image.redis[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
  restart = "unless-stopped"
  # ports {
  #   internal = var.VARS.PORTS.DATABASES.REDIS_PORT_INT
  #   external = var.VARS.PORTS.DATABASES.REDIS_PORT_EXT
  # }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
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
