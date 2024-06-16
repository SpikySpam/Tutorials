resource "docker_network" "freescout" {
  count  = 0
  name   = "${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "freescout-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}",
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
    name = "${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}"
  }
}

# FREESCOUT
resource "docker_image" "freescout" {
  count = 0
  depends_on = [ docker_container.freescout-postgres ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_FREESCOUT}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_FREESCOUT}"
    }
  }
}

resource "docker_container" "freescout" {
  count   = 0
  image   = docker_image.freescout[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.FREESCOUT_PORT_INT
    external = var.vars.PORTS.TOOLS.FREESCOUT_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/logs"
    container_path = "/www/logs"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/custom"
    container_path = "/assets/custom"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/custom-scripts"
    container_path = "/assets/custom-scripts"
  }
  # volumes {
  #   host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/modules"
  #   container_path = "/assets/modules"
  # }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/html"
    container_path = "/www/html"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}/data"
    container_path = "/data"
  }
  env = [
    "APPLICATION_NAME=${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}",
    "SITE_URL=https://${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}.${var.vars.DOMAIN}",
    "SETUP_TYPE=AUTO",
    "ENABLE_SSL_PROXY=TRUE",
    "ENABLE_AUTO_UPDATE=TRUE",
    "DISPLAY_ERRORS=FALSE",
    "APP_DEBUG=FALSE",
    "TIMEZONE=${var.vars.SECRETS.TOOLS.FREESCOUT_TZ}",
    "ADMIN_EMAIL=${var.vars.SECRETS.NETWORK.MAILINABOX_USER}",
    "ADMIN_PASS=${var.vars.SECRETS.TOOLS.FREESCOUT_PASSWORD}",
    "DB_TYPE=pgsql",
    "DB_HOST=${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_PORT=${var.vars.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "DB_NAME=${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}",
    "DB_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASS=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "DB_PGSQL_SSL_MODE=prefer",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.TOOLS.FREESCOUT_NAME}"
  }
}
