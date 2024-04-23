resource "docker_network" "keycloak" {
  count  = 0
  name   = "${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "keycloak-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}",
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
    name = "${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}"
  }
}

# KEYCLOAK
resource "docker_image" "keycloak" {
  count = 0
  depends_on = [ docker_container.keycloak-postgres ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KEYCLOAK}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KEYCLOAK}"
    }
  }
}

resource "docker_container" "keycloak" {
  count   = 0
  image   = docker_image.keycloak[0].image_id
  name    = "${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.SECURITY.KEYCLOAK_PORT_INT
    external = var.VARS.PORTS.SECURITY.KEYCLOAK_PORT_EXT
  }
  env = [
    "DB_VENDOR=postgres",
    "DB_ADDR=${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_SCHEMA=public",
    "DB_DATABASE=${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}",
    "DB_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "KEYCLOAK_ADMIN=${var.VARS.SECRETS.SECURITY.KEYCLOAK_USER}",
    "KEYCLOAK_ADMIN_PASSWORD=${var.VARS.SECRETS.SECURITY.KEYCLOAK_PASSWORD}",
  ]
  command = [
    "start-dev",
  ]  
  networks_advanced {
    name = "${var.VARS.SECRETS.SECURITY.KEYCLOAK_NAME}"
  }
}
