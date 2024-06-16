resource "docker_image" "postgres" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_POSTGRES}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_POSTGRES}"
    }
  }
}

resource "docker_container" "postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.POSTGRES_PORT_INT
    external = var.vars.PORTS.DATABASES.POSTGRES_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
  ]
  healthcheck {
    test     = ["CMD-SHELL", "pg_isready"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
}
