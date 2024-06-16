resource "docker_network" "vaultwarden" {
  count  = 0
  name   = "${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "vaultwarden-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}",
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
    name = "${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
  }
}

# VAULTWARDEN
resource "docker_image" "vaultwarden" {
  count = 0
  depends_on = [ docker_container.vaultwarden-postgres ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_VAULTWARDEN}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_VAULTWARDEN}"
    }
  }
}

resource "docker_container" "vaultwarden" {
  count   = 0
  image   = docker_image.vaultwarden[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.SECURITY.VAULTWARDEN_PORT_INT
    external = var.vars.PORTS.SECURITY.VAULTWARDEN_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
    container_path = "/data"
  }
  env = [
    "DATABASE_URL=postgresql://${var.vars.SECRETS.DATABASES.POSTGRES_USER}:${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}@${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}:${var.vars.PORTS.DATABASES.POSTGRES_PORT_INT}/${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}",
    "ADMIN_TOKEN=${var.vars.SECRETS.SECURITY.VAULTWARDEN_ADMIN_TOKEN}",
    "DOMAIN=https://${var.vars.SECRETS.SECURITY.VAULTWARDEN_DOMAIN}",
    "SMTP_HOST=${var.vars.SECRETS.SMTP.SMTP_HOST}",
    "SMTP_FROM=${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}@${var.vars.DOMAIN}",
    "SMTP_FROM_NAME=${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}",
    "SMTP_SECURITY=${var.vars.SECRETS.SMTP.SMTP_SECURITY}",
    "SMTP_PORT=${var.vars.SECRETS.SMTP.SMTP_PORT}",
    "SMTP_USERNAME=${var.vars.SECRETS.SMTP.SMTP_USERNAME}",
    "SMTP_PASSWORD=${var.vars.SECRETS.SMTP.SMTP_PASSWORD}",
    "SMTP_TIMEOUT=30",
    "SMTP_AUTH_MECHANISM=Login",
    "LOGIN_RATELIMIT_MAX_BURST=10",
    "LOGIN_RATELIMIT_SECONDS=60",
    "INVITATION_ORG_NAME=${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}",
    "INVITATIONS_ALLOWED=false",
    "SIGNUPS_ALLOWED=true",
    "SIGNUPS_DOMAINS_WHITELIST=${var.vars.SECRETS.SECURITY.VAULTWARDEN_DOMAIN}",
    "SIGNUPS_VERIFY=true",
    "SIGNUPS_VERIFY_RESEND_TIME=3600",
    "SIGNUPS_VERIFY_RESEND_LIMIT=1",
    "EMERGENCY_ACCESS_ALLOWED=false",
    "SHOW_PASSWORD_HINT=false",
    "SENDS_ALLOWED=true",
    "WEB_VAULT_ENABLED=true",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.SECURITY.VAULTWARDEN_NAME}"
  }
}
