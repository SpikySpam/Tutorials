resource "docker_image" "kibana" {
  count = 1
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.KIBANA_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KIBANA}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.KIBANA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_KIBANA}"
    }
  }
}

resource "docker_container" "kibana" {
  count   = 1
  image   = docker_image.kibana[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.KIBANA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.KIBANA_PORT_INT
    external = var.VARS.PORTS.DATABASES.KIBANA_PORT_EXT
  }
  env = [
    "ELASTICSEARCH_URL=http://${var.VARS.SECRETS.DATABASES.ELASTICSEARCH_NAME}:${var.VARS.PORTS.DATABASES.ELASTICSEARCH_PORT_INT}'",
    "ELASTICSEARCH_HOSTS=http://${var.VARS.SECRETS.DATABASES.ELASTICSEARCH_NAME}:${var.VARS.PORTS.DATABASES.ELASTICSEARCH_PORT_INT}'",
  ]
}
