resource "docker_network" "listmonk" {
  count  = 0
  name   = "${var.vars.SECRETS.TOOLS.LISTMONK_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "listmonk-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.LISTMONK_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.LISTMONK_NAME}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.vars.SECRETS.TOOLS.LISTMONK_NAME}",
  ]
  healthcheck {
    test     = ["CMD-SHELL", "pg_isready"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
  wait = true
  wait_timeout = 60
  networks_advanced {
    name = "${var.vars.SECRETS.TOOLS.LISTMONK_NAME}"
  }
}

# LISTMONK
resource "docker_image" "listmonk" {
  count = 0
  depends_on = [ docker_container.listmonk-postgres ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.LISTMONK_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_LISTMONK}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.LISTMONK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_LISTMONK}"
    }
  }
}

resource "docker_container" "listmonk" {
  count   = 0
  image   = docker_image.listmonk[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.LISTMONK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.LISTMONK_PORT_INT
    external = var.vars.PORTS.TOOLS.LISTMONK_PORT_EXT
  }
  env = [
    "TZ=Etc/UTC",
    "LISTMONK_NAME=${var.vars.SECRETS.TOOLS.LISTMONK_NAME}",
    "LISTMONK_USER=${var.vars.SECRETS.TOOLS.LISTMONK_USER}",
    "LISTMONK_PASSWORD=${var.vars.SECRETS.TOOLS.LISTMONK_PASSWORD}",
    "LISTMONK_PORT_INT=${var.vars.PORTS.TOOLS.LISTMONK_PORT_INT}",
    "POSTGRES_NAME=${var.vars.SECRETS.DATABASES.POSTGRES_NAME}",
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_PORT_INT=${var.vars.PORTS.DATABASES.POSTGRES_PORT_INT}",
  ]
  command = [
    "sh",
    "./entrypoint.sh",
  ]  
  networks_advanced {
    name = "${var.vars.SECRETS.TOOLS.LISTMONK_NAME}"
  }
}
