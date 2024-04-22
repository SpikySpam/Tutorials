resource "docker_network" "kutt" {
  count  = 0
  name   = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
  driver = "bridge"
}

# POSTGRES
resource "docker_container" "kutt-postgres" {
  count   = 0
  image   = docker_image.postgres[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.KUTT_NAME}/${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}"
    container_path = "/var/lib/postgresql/data"
  }
  env = [
    "POSTGRES_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "POSTGRES_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "POSTGRES_DB=${var.VARS.SECRETS.TOOLS.KUTT_NAME}",
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
    name = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
  }
}

# REDIS
resource "docker_container" "kutt-redis" {
  count   = 0
  image   = docker_image.redis[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}-${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.KUTT_NAME}/${var.VARS.SECRETS.DATABASES.REDIS_NAME}"
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
    name = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
  }
}

# KUTT
resource "docker_image" "kutt" {
  count = 0
  depends_on = [ docker_container.kutt-postgres, docker_container.kutt-redis ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.KUTT_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KUTT}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KUTT}"
    }
  }
}

resource "docker_container" "kutt" {
  count   = 0
  image   = docker_image.kutt[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.KUTT_PORT_INT
    external = var.VARS.PORTS.TOOLS.KUTT_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
    container_path = "/data"
  }
  env = [
    "SITE_NAME=${var.VARS.SECRETS.TOOLS.KUTT_NAME}",
    "DEFAULT_DOMAIN=${var.VARS.SECRETS.TOOLS.KUTT_NAME}.${var.VARS.DOMAIN}",
    "DB_HOST=${var.VARS.SECRETS.TOOLS.KUTT_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}",
    "DB_PORT=${var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "DB_NAME=${var.VARS.SECRETS.TOOLS.KUTT_NAME}",
    "DB_USER=${var.VARS.SECRETS.DATABASES.POSTGRES_USER}",
    "DB_PASSWORD=${var.VARS.SECRETS.DATABASES.POSTGRES_PASSWORD}",
    "DB_SSL=false",
    "REDIS_HOST=${var.VARS.SECRETS.TOOLS.KUTT_NAME}-${var.VARS.SECRETS.DATABASES.REDIS_NAME}",
    "REDIS_PORT=${var.VARS.PORTS.DATABASES.REDIS_PORT_INT}",
    # "REDIS_PASSWORD=${var.VARS.SECRETS.DATABASES.REDIS_PASSWORD}",
    "REDIS_DB=${var.VARS.SECRETS.TOOLS.KUTT_NAME}",
    "MAIL_HOST=${var.VARS.SECRETS.SMTP.SMTP_HOST}",
    "MAIL_PORT=${var.VARS.SECRETS.SMTP.SMTP_PORT}",
    "MAIL_SECURE=false",
    "MAIL_USER=${var.VARS.SECRETS.SMTP.SMTP_USERNAME}",
    "MAIL_PASSWORD=${var.VARS.SECRETS.SMTP.SMTP_PASSWORD}",
    "MAIL_FROM=${var.VARS.SECRETS.TOOLS.KUTT_NAME}@${var.VARS.DOMAIN}",
    "REPORT_EMAIL=${var.VARS.SECRETS.SMTP.SMTP_USERNAME}",
    "CONTACT_EMAIL=${var.VARS.SECRETS.SMTP.SMTP_USERNAME}",
    "DISALLOW_REGISTRATION=false",
    "DISALLOW_ANONYMOUS_LINKS=false",
    "USER_LIMIT_PER_DAY=50",
    "NON_USER_COOLDOWN=0",
    "DEFAULT_MAX_STATS_PER_LINK=5000",
    "CUSTOM_DOMAIN_USE_HTTPS=false",
    "JWT_SECRET=${var.VARS.SECRETS.TOOLS.KUTT_PASSWORD}",
    "ADMIN_EMAILS=${var.VARS.SECRETS.SMTP.SMTP_USERNAME}",
  ]
  command = [
    "./wait-for-it.sh",
    "${var.VARS.SECRETS.TOOLS.KUTT_NAME}-${var.VARS.SECRETS.DATABASES.POSTGRES_NAME}:${var.VARS.PORTS.DATABASES.POSTGRES_PORT_INT}",
    "--",
    "npm",
    "start",
  ]  
  networks_advanced {
    name = "${var.VARS.SECRETS.TOOLS.KUTT_NAME}"
  }
}


