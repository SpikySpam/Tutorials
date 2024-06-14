resource "docker_network" "gitlab" {
  count  = 1
  name   = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "gitlab-postgres" {
  count   = 1
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}",
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
    name = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}

# REDIS
resource "docker_container" "gitlab-redis" {
  count   = 1
  image   = docker_image.redis[0].image_id
  name    = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}/${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
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
    name = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}

# GITLAB
resource "docker_image" "gitlab" {
  count = 1
  depends_on = [ docker_container.gitlab-postgres, docker_container.gitlab-redis ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_GITLAB}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_GITLAB}"
    }
  }
}

resource "docker_container" "gitlab" {
  count   = 1
  image   = docker_image.gitlab[0].image_id
  name    = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_INT_80
    external = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_80
  }
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_INT_443
    external = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_443
  }
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_INT_22
    external = var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_22
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}/data"
    container_path = "/home/git/data"
  }
  env = [
    "DEBUG=false",
    "SIGNUP_ENABLED=false",
    "SSL_SELF_SIGNED=false",
    "DB_ADAPTER=postgresql",
    "DB_HOST=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_PORT=${var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "DB_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASS=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "DB_NAME=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}",
    "REDIS_HOST=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}-${var.VARS.SECRETS.DATABASES.REDIS_NAME}",
    "REDIS_PORT=${var.VARS.PORTS.DATABASES.REDIS_PORT_INT}",
    "TZ=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_TZ}",
    "GITLAB_TIMEZONE=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_TZ}",
    "GITLAB_HTTPS=false",
    "GITLAB_HOST=${var.VARS.DOMAIN}",
    "GITLAB_PORT=${var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_80}",
    "GITLAB_SSH_PORT=${var.VARS.PORTS.DEVELOPMENT.GITLAB_PORT_EXT_22}",
    "GITLAB_RELATIVE_URL_ROOT=",
    "GITLAB_SECRETS_DB_KEY_BASE=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_KEY_DB}",
    "GITLAB_SECRETS_SECRET_KEY_BASE=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_KEY_SECRET}",
    "GITLAB_SECRETS_OTP_KEY_BASE=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_KEY_OTP}",
    "GITLAB_ROOT_PASSWORD=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_PASSWORD}",
    "GITLAB_ROOT_EMAIL=${var.VARS.SECRETS.DEVELOPMENT.GITLAB_USER}@${var.VARS.DOMAIN}",
    "GITLAB_NOTIFY_ON_BROKEN_BUILDS=true",
    "GITLAB_NOTIFY_PUSHER=false",
    "GITLAB_EMAIL=gitlab@${var.VARS.DOMAIN}",
    "GITLAB_EMAIL_REPLY_TO=noreply@${var.VARS.DOMAIN}",
    "GITLAB_INCOMING_EMAIL_ADDRESS=reply@${var.VARS.DOMAIN}",
    "GITLAB_BACKUP_SCHEDULE=daily",
    "GITLAB_BACKUP_TIME=01:00",
    "SMTP_ENABLED=true",
    "SMTP_DOMAIN=${var.VARS.DOMAIN}",
    "SMTP_HOST=${var.VARS.SECRETS.SMTP.SMTP_HOST}",
    "SMTP_PORT=${var.VARS.SECRETS.SMTP.SMTP_PORT}",
    "SMTP_USER=${var.VARS.SECRETS.SMTP.SMTP_USERNAME}",
    "SMTP_PASS=${var.VARS.SECRETS.SMTP.SMTP_PASSWORD}",
    "SMTP_STARTTLS=${var.VARS.SECRETS.SMTP.SMTP_STARTTLS}",
    "SMTP_AUTHENTICATION=login",
    "IMAP_ENABLED=false",
    "IMAP_HOST=${var.VARS.SECRETS.SMTP.IMAP_HOST}",
    "IMAP_PORT=${var.VARS.SECRETS.SMTP.IMAP_PORT}",
    "IMAP_USER=${var.VARS.SECRETS.SMTP.IMAP_USERNAME}",
    "IMAP_PASS=${var.VARS.SECRETS.SMTP.IMAP_PASSWORD}",
    "IMAP_SSL=${var.VARS.SECRETS.SMTP.IMAP_SSL}",
    "IMAP_STARTTLS=${var.VARS.SECRETS.SMTP.IMAP_STARTTLS}",
  ]
  networks_advanced {
    name = "${var.VARS.SECRETS.DEVELOPMENT.GITLAB_NAME}"
  }
}
