resource "docker_network" "freescout" {
  count  = 0
  name   = "${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "freescout-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}",
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
    name = "${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}"
  }
}

# FREESCOUT
resource "docker_image" "freescout" {
  count = 0
  depends_on = [ docker_container.freescout-postgres ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_FREESCOUT}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_FREESCOUT}"
    }
  }
}

resource "docker_container" "freescout" {
  count   = 0
  image   = docker_image.freescout[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.FREESCOUT_PORT_INT
    external = var.VARS.PORTS.TOOLS.FREESCOUT_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/logs"
    container_path = "/www/logs"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/custom"
    container_path = "/assets/custom"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/custom-scripts"
    container_path = "/assets/custom-scripts"
  }
  # volumes {
  #   host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/modules"
  #   container_path = "/assets/modules"
  # }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/html"
    container_path = "/www/html"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}/data"
    container_path = "/data"
  }
  env = [
    "APPLICATION_NAME=${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}",
    "SITE_URL=https://${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}.${var.VARS.DOMAIN}",
    "SETUP_TYPE=AUTO",
    "ENABLE_SSL_PROXY=TRUE",
    "ENABLE_AUTO_UPDATE=TRUE",
    "DISPLAY_ERRORS=FALSE",
    "APP_DEBUG=FALSE",
    "TIMEZONE=${var.VARS.SECRETS.TOOLS.FREESCOUT_TZ}",
    "ADMIN_EMAIL=${var.VARS.SECRETS.NETWORK.MAILINABOX_USER}",
    "ADMIN_PASS=${var.VARS.SECRETS.TOOLS.FREESCOUT_PASSWORD}",
    "DB_TYPE=pgsql",
    "DB_HOST=${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_PORT=${var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "DB_NAME=${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}",
    "DB_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASS=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "DB_PGSQL_SSL_MODE=prefer",
  ]
  networks_advanced {
    name = "${var.VARS.SECRETS.TOOLS.FREESCOUT_NAME}"
  }
}
