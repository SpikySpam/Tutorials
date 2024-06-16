resource "docker_image" "rabbitmq" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_RABBITMQ}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_RABBITMQ}"
    }
  }
}

resource "docker_container" "rabbitmq" {
  count   = 0
  image   = docker_image.rabbitmq[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.RABBITMQ_PORT_INT_NODE
    external = var.vars.PORTS.DEVELOPMENT.RABBITMQ_PORT_EXT_NODE
  }
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.RABBITMQ_PORT_INT_DIST
    external = var.vars.PORTS.DEVELOPMENT.RABBITMQ_PORT_EXT_DIST
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_NAME}/data"
    container_path = "/var/lib/rabbitmq"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_NAME}/log"
    container_path = "/var/log/rabbitmq"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  env = [
    "RABBITMQ_DEFAULT_USER=${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_USER}",
    "RABBITMQ_DEFAULT_PASS=${var.vars.SECRETS.DEVELOPMENT.RABBITMQ_PASSWORD}",
  ]
  user = "root"
}
