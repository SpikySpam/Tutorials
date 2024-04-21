resource "docker_image" "rabbitmq" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_RABBITMQ}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_RABBITMQ}"
    }
  }
}

resource "docker_container" "rabbitmq" {
  count   = 0
  image   = docker_image.rabbitmq[0].image_id
  name    = "${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.RABBITMQ_PORT_INT_NODE
    external = var.VARS.PORTS.DEVELOPMENT.RABBITMQ_PORT_EXT_NODE
  }
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.RABBITMQ_PORT_INT_DIST
    external = var.VARS.PORTS.DEVELOPMENT.RABBITMQ_PORT_EXT_DIST
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_NAME}/data"
    container_path = "/var/lib/rabbitmq"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_NAME}/log"
    container_path = "/var/log/rabbitmq"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  env = [
    "RABBITMQ_DEFAULT_USER=${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_USER}",
    "RABBITMQ_DEFAULT_PASS=${var.VARS.SECRETS.DEVELOPMENT.RABBITMQ_PASSWORD}",
  ]
  user = "root"
}
