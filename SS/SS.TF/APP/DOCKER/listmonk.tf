resource "docker_network" "listmonk" {
  count  = 0
  name   = "${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "listmonk-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}",
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
    name = "${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}"
  }
}

# LISTMONK
resource "docker_image" "listmonk" {
  count = 0
  depends_on = [ docker_container.listmonk-postgres ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_LISTMONK}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_LISTMONK}"
    }
  }
}

resource "docker_container" "listmonk" {
  count   = 0
  image   = docker_image.listmonk[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.LISTMONK_PORT_INT
    external = var.VARS.PORTS.TOOLS.LISTMONK_PORT_EXT
  }
  env = [
    "TZ=Etc/UTC",
    "LISTMONK_NAME=${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}",
    "LISTMONK_USER=${var.VARS.SECRETS.TOOLS.LISTMONK_USER}",
    "LISTMONK_PASSWORD=${var.VARS.SECRETS.TOOLS.LISTMONK_PASSWORD}",
    "LISTMONK_PORT_INT=${var.VARS.PORTS.TOOLS.LISTMONK_PORT_INT}",
    "POSTGRES_NAME=${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}",
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_PORT_INT=${var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT}",
  ]
  command = [
    "sh",
    "./entrypoint.sh",
  ]  
  networks_advanced {
    name = "${var.VARS.SECRETS.TOOLS.LISTMONK_NAME}"
  }
}
