resource "docker_network" "guacamole" {
  count  = 0
  name   = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
  driver = "bridge"
}

# MYSQL
resource "docker_container" "guacamole-mysql" {
  count   = 0
  image   = docker_image.mysql[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}-${var.vars.SECRETS.DATABASES.MYSQL_NAME}"
  restart = "unless-stopped"
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/${var.vars.SECRETS.DATABASES.MYSQL_NAME}"
    container_path = "/var/lib/mysql"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/config/${var.vars.SECRETS.DATABASES.MYSQL_NAME}/init.sql"
    container_path = "/docker-entrypoint-initdb.d/init.sql"
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${var.vars.SECRETS.DATABASES.MYSQL_PASSWORD}",
    "MYSQL_USER=${var.vars.SECRETS.DATABASES.MYSQL_USER}",
    "MYSQL_PASSWORD=${var.vars.SECRETS.DATABASES.MYSQL_PASSWORD}",
    "MYSQL_DATABASE=${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}",
  ]
  healthcheck {
    test     = ["CMD", "mysqladmin" ,"ping", "-h", "localhost"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
  wait = true
  wait_timeout = 60
  networks_advanced {
    name = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
  }
}

# GUACD
resource "docker_image" "guacd" {
  count = 0
  depends_on = [ docker_container.guacamole-mysql ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.SECURITY.GUACD_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GUACD}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
    dockerfile = "dockerfile_${var.vars.SECRETS.SECURITY.GUACD_NAME}"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GUACD}"
    }
  }
}

resource "docker_container" "guacd" {
  count   = 0
  image   = docker_image.guacd[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.GUACD_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.SECURITY.GUACD_PORT_INT
    external = var.vars.PORTS.SECURITY.GUACD_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/${var.vars.SECRETS.SECURITY.GUACD_NAME}/config"
    container_path = "/config"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/${var.vars.SECRETS.SECURITY.GUACD_NAME}/drive"
    container_path = "/drive"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/${var.vars.SECRETS.SECURITY.GUACD_NAME}/record"
    container_path = "/record"
  }
  networks_advanced {
    name = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
  }
}

# GUACAMOLE
resource "docker_image" "guacamole" {
  count = 0
  depends_on = [ docker_container.guacamole-mysql, docker_container.guacd ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GUACAMOLE}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
    dockerfile = "dockerfile_${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GUACAMOLE}"
    }
  }
}

resource "docker_container" "guacamole" {
  count   = 0
  image   = docker_image.guacamole[0].image_id
  name    = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.SECURITY.GUACAMOLE_PORT_INT
    external = var.vars.PORTS.SECURITY.GUACAMOLE_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}/initdb"
    container_path = "/data"
  }
  env = [
    "GUACD_HOSTNAME=${var.vars.SECRETS.SECURITY.GUACD_NAME}",
    "GUACD_PORT=${var.vars.PORTS.SECURITY.GUACD_PORT_INT}",
    "MYSQL_HOSTNAME=${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}-${var.vars.SECRETS.DATABASES.MYSQL_NAME}",
    "MYSQL_DATABASE=${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}",
    "MYSQL_USER=${var.vars.SECRETS.DATABASES.MYSQL_USER}",
    "MYSQL_PASSWORD=${var.vars.SECRETS.DATABASES.MYSQL_PASSWORD}",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.SECURITY.GUACAMOLE_NAME}"
  }
}
