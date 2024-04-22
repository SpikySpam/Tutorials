resource "docker_network" "cassandra" {
  count  = 0
  name   = "${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
  driver = "bridge"
}

# CASSANDRA
resource "docker_image" "cassandra" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
    dockerfile = "dockerfile-db"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA}"
    }
  }
}

resource "docker_container" "cassandra" {
  count   = 0
  image   = docker_image.cassandra[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.CASSANDRA_PORT_INT
    external = var.VARS.PORTS.DATABASES.CASSANDRA_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
    container_path = "/var/lib/cassandra"
  }
  env = [
    "CASSANDRA_USER=${var.VARS.SECRETS.DATABASES.CASSANDRA_USER}",
    "CASSANDRA_PASSWORD=${var.VARS.SECRETS.DATABASES.CASSANDRA_PASSWORD}",
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
    name = "${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
  }
}

# CASSANDRA-WEB
resource "docker_image" "cassandra-web" {
  count = 0
  depends_on = [ docker_container.cassandra ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}-web:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA_WEB}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
    dockerfile = "dockerfile-web"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CASSANDRA_WEB}"
    }
  }
}

resource "docker_container" "cassandra-web" {
  count   = 0
  image   = docker_image.cassandra-web[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}-web"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.CASSANDRA_WEB_PORT_INT
    external = var.VARS.PORTS.DATABASES.CASSANDRA_WEB_PORT_EXT
  }
  env = [
    "HOST_PORT=:${var.VARS.PORTS.DATABASES.CASSANDRA_WEB_PORT_INT}",
    "READ_ONLY: false",
    "CASSANDRA_HOST=${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}",
    "CASSANDRA_PORT=${var.VARS.PORTS.DATABASES.CASSANDRA_PORT_INT}",
    "CASSANDRA_USERNAME=${var.VARS.SECRETS.DATABASES.CASSANDRA_USER}",
    "CASSANDRA_PASSWORD=${var.VARS.SECRETS.DATABASES.CASSANDRA_PASSWORD}",
  ]
  networks_advanced {
    name = "${var.VARS.SECRETS.DATABASES.CASSANDRA_NAME}"
  }
}
