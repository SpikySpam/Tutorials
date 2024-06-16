resource "docker_image" "redis-commander" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.REDISCOMMANDER_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_REDISCOMMANDER}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.REDISCOMMANDER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_REDISCOMMANDER}"
    }
  }
}

resource "docker_container" "redis-commander" {
  count   = 0
  image   = docker_image.redis-commander[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.REDISCOMMANDER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.REDISCOMMANDER_PORT_INT
    external = var.vars.PORTS.DATABASES.REDISCOMMANDER_PORT_EXT
  }
  env = [
    "REDIS_HOSTS=local:${var.vars.SECRETS.DATABASES.REDIS_NAME}:${var.vars.PORTS.DATABASES.REDIS_PORT_INT}",
  ]
}
