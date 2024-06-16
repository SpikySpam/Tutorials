resource "docker_network" "keycloak" {
  count  = 0
  name   = "${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "keycloak-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}",
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
    name = "${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}"
  }
}

# KEYCLOAK
resource "docker_image" "keycloak" {
  count = 0
  depends_on = [ docker_container.keycloak-postgres ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KEYCLOAK}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KEYCLOAK}"
    }
  }
}

resource "docker_container" "keycloak" {
  count   = 0
  image   = docker_image.keycloak[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.SECURITY.KEYCLOAK_PORT_INT
    external = var.vars.PORTS.SECURITY.KEYCLOAK_PORT_EXT
  }
  env = [
    "DB_VENDOR=postgres",
    "DB_ADDR=${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_SCHEMA=public",
    "DB_DATABASE=${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}",
    "DB_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "KEYCLOAK_ADMIN=${var.vars.SECRETS.SECURITY.KEYCLOAK_USER}",
    "KEYCLOAK_ADMIN_PASSWORD=${var.vars.SECRETS.SECURITY.KEYCLOAK_PASSWORD}",
  ]
  command = [
    "start-dev",
  ]  
  networks_advanced {
    name = "${var.vars.SECRETS.SECURITY.KEYCLOAK_NAME}"
  }
}
