resource "docker_network" "cassandra" {
  count  = 0
  name   = "${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
  driver = "bridge"
}

# CASSANDRA
resource "docker_image" "cassandra" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
    dockerfile = "dockerfile-db"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA}"
    }
  }
}

resource "docker_container" "cassandra" {
  count   = 0
  image   = docker_image.cassandra[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.CASSANDRA_PORT_INT
    external = var.vars.PORTS.DATABASES.CASSANDRA_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
    container_path = "/var/lib/cassandra"
  }
  env = [
    "CASSANDRA_USER=${var.vars.SECRETS.DATABASES.CASSANDRA_USER}",
    "CASSANDRA_PASSWORD=${var.vars.SECRETS.DATABASES.CASSANDRA_PASSWORD}",
  ]
  healthcheck {
    test     = ["CMD", "cqlsh", "-e", "describe keyspaces"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
  wait = true
  wait_timeout = 60
  networks_advanced {
    name = "${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
  }
}

# CASSANDRA-WEB
resource "docker_image" "cassandra-web" {
  count = 0
  depends_on = [ docker_container.cassandra ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}-web:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA_WEB}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
    dockerfile = "dockerfile-web"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA_WEB}"
    }
  }
}

resource "docker_container" "cassandra-web" {
  count   = 0
  image   = docker_image.cassandra-web[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}-web"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.CASSANDRA_WEB_PORT_INT
    external = var.vars.PORTS.DATABASES.CASSANDRA_WEB_PORT_EXT
  }
  env = [
    "HOST_PORT=:${var.vars.PORTS.DATABASES.CASSANDRA_WEB_PORT_INT}",
    "READ_ONLY: false",
    "CASSANDRA_HOST=${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}",
    "CASSANDRA_PORT=${var.vars.PORTS.DATABASES.CASSANDRA_PORT_INT}",
    "CASSANDRA_USERNAME=${var.vars.SECRETS.DATABASES.CASSANDRA_USER}",
    "CASSANDRA_PASSWORD=${var.vars.SECRETS.DATABASES.CASSANDRA_PASSWORD}",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.DATABASES.CASSANDRA_NAME}"
  }
}
