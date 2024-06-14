resource "docker_image" "redis-commander" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.REDISCOMMANDER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_REDISCOMMANDER}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.REDISCOMMANDER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_REDISCOMMANDER}"
    }
  }
}

resource "docker_container" "redis-commander" {
  count   = 0
  image   = docker_image.redis-commander[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.REDISCOMMANDER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.REDISCOMMANDER_PORT_INT
    external = var.VARS.PORTS.DATABASES.REDISCOMMANDER_PORT_EXT
  }
  env = [
    "REDIS_HOSTS=local:${var.VARS.SECRETS.DATABASES.REDIS_NAME}:${var.VARS.PORTS.DATABASES.REDIS_PORT_INT}",
  ]
}
