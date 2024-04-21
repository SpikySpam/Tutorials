resource "docker_image" "postgres" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_POSTGRES}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_POSTGRES}"
    }
  }
}

resource "docker_container" "postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT
    external = var.VARS.PORTS.DATABASES.POSTGRES_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
  ]
  healthcheck {
    test     = ["CMD-SHELL", "pg_isready"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
