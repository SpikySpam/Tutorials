resource "docker_image" "rabbitmq" {
  count = var.current.rabbitmq.docker.enabled ? 1 : 0
  name  = "${var.vars.DOMAIN}/${var.current.rabbitmq.name}:${var.current.rabbitmq.docker.version}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.current.rabbitmq.name}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.current.rabbitmq.docker.version}"
    }
  }
}

resource "docker_container" "rabbitmq" {
  count   = var.current.rabbitmq.docker.enabled ? 1 : 0
  image   = docker_image.rabbitmq[0].image_id
  name    = "${var.current.rabbitmq.name}"
  restart = "unless-stopped"
  ports {
    internal = var.current.rabbitmq.ports.node.internal
    external = var.current.rabbitmq.ports.node.external
  }
  ports {
    internal = var.current.rabbitmq.ports.dist.internal
    external = var.current.rabbitmq.ports.dist.external
  }  
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.current.rabbitmq.name}/data"
    container_path = "/var/lib/rabbitmq"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.current.rabbitmq.name}/log"
    container_path = "/var/log/rabbitmq"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  env = [
    "RABBITMQ_DEFAULT_USER=${var.current.rabbitmq.helm.values.auth.username}",
    "RABBITMQ_DEFAULT_PASS=${var.current.rabbitmq.helm.values.auth.password}",
  ]
  user = "root"
}
