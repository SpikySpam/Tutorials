resource "docker_network" "gitlab" {
  count  = 0
  name   = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "gitlab-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}/${var.vars.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}",
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
    name = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}

# REDIS
resource "docker_container" "gitlab-redis" {
  count   = 0
  image   = docker_image.redis[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.vars.SECRETS.DATABASES.REDIS_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}/${var.vars.SECRETS.DATABASES.REDIS_NAME}"
    container_path = "/data"
  }
  command = [
    "redis-server",
    "--save 20 1",
    "--loglevel warning ",
  ]
  healthcheck {
    test     = [ "CMD", "redis-cli", "--raw", "incr", "ping" ]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
  wait = true
  wait_timeout = 60
  networks_advanced {
    name = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}

# GITLAB
resource "docker_image" "gitlab" {
  count = 0
  depends_on = [ docker_container.gitlab-postgres, docker_container.gitlab-redis ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GITLAB}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GITLAB}"
    }
  }
}

resource "docker_container" "gitlab" {
  count   = 0
  image   = docker_image.gitlab[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_INT_80
    external = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_80
  }
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_INT_443
    external = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_443
  }
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_INT_22
    external = var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_22
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}/data"
    container_path = "/home/git/data"
  }
  env = [
    "DEBUG=false",
    "SIGNUP_ENABLED=false",
    "SSL_SELF_SIGNED=false",
    "DB_ADAPTER=postgresql",
    "DB_HOST=${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.vars.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_PORT=${var.vars.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "DB_USER=${var.vars.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASS=${var.vars.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "DB_NAME=${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}",
    "REDIS_HOST=${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.vars.SECRETS.DATABASES.REDIS_NAME}",
    "REDIS_PORT=${var.vars.PORTS.DATABASES.REDIS_PORT_INT}",
    "TZ=${var.vars.SECRETS.DEVELOPMENT.GITLAB_TZ}",
    "GITLAB_TIMEZONE=${var.vars.SECRETS.DEVELOPMENT.GITLAB_TZ}",
    "GITLAB_HTTPS=false",
    "GITLAB_HOST=${var.vars.DOMAIN}",
    "GITLAB_PORT=${var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_80}",
    "GITLAB_SSH_PORT=${var.vars.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_22}",
    "GITLAB_RELATIVE_URL_ROOT=",
    "GITLAB_SECRETS_DB_KEY_BASE=${var.vars.SECRETS.DEVELOPMENT.GITLAB_KEY_DB}",
    "GITLAB_SECRETS_SECRET_KEY_BASE=${var.vars.SECRETS.DEVELOPMENT.GITLAB_KEY_SECRET}",
    "GITLAB_SECRETS_OTP_KEY_BASE=${var.vars.SECRETS.DEVELOPMENT.GITLAB_KEY_OTP}",
    "GITLAB_ROOT_PASSWORD=${var.vars.SECRETS.DEVELOPMENT.GITLAB_PASSWORD}",
    "GITLAB_ROOT_EMAIL=${var.vars.SECRETS.DEVELOPMENT.GITLAB_USER}@${var.vars.DOMAIN}",
    "GITLAB_NOTIFY_ON_BROKEN_BUILDS=true",
    "GITLAB_NOTIFY_PUSHER=false",
    "GITLAB_EMAIL=gitlab@${var.vars.DOMAIN}",
    "GITLAB_EMAIL_REPLY_TO=noreply@${var.vars.DOMAIN}",
    "GITLAB_INCOMING_EMAIL_ADDRESS=reply@${var.vars.DOMAIN}",
    "GITLAB_BACKUP_SCHEDULE=daily",
    "GITLAB_BACKUP_TIME=01:00",
    "SMTP_ENABLED=true",
    "SMTP_DOMAIN=${var.vars.DOMAIN}",
    "SMTP_HOST=${var.vars.SECRETS.SMTP.SMTP_HOST}",
    "SMTP_PORT=${var.vars.SECRETS.SMTP.SMTP_PORT}",
    "SMTP_USER=${var.vars.SECRETS.SMTP.SMTP_USERNAME}",
    "SMTP_PASS=${var.vars.SECRETS.SMTP.SMTP_PASSWORD}",
    "SMTP_STARTTLS=${var.vars.SECRETS.SMTP.SMTP_STARTTLS}",
    "SMTP_AUTHENTICATION=login",
    "IMAP_ENABLED=false",
    "IMAP_HOST=${var.vars.SECRETS.SMTP.IMAP_HOST}",
    "IMAP_PORT=${var.vars.SECRETS.SMTP.IMAP_PORT}",
    "IMAP_USER=${var.vars.SECRETS.SMTP.IMAP_USERNAME}",
    "IMAP_PASS=${var.vars.SECRETS.SMTP.IMAP_PASSWORD}",
    "IMAP_SSL=${var.vars.SECRETS.SMTP.IMAP_SSL}",
    "IMAP_STARTTLS=${var.vars.SECRETS.SMTP.IMAP_STARTTLS}",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}
