resource "docker_image" "kibana" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.KIBANA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KIBANA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.KIBANA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_KIBANA}"
    }
  }
}

resource "docker_container" "kibana" {
  count   = 0
  image   = docker_image.kibana[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.KIBANA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.KIBANA_PORT_INT
    external = var.vars.PORTS.DATABASES.KIBANA_PORT_EXT
  }
  env = [
    "ELASTICSEARCH_URL=http://${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}:${var.vars.PORTS.DATABASES.ELASTICSEARCH_PORT_INT}'",
    "ELASTICSEARCH_HOSTS=http://${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}:${var.vars.PORTS.DATABASES.ELASTICSEARCH_PORT_INT}'",
  ]
}
