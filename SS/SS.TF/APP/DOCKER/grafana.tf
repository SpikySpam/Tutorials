resource "docker_image" "grafana" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_GRAFANA}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_GRAFANA}"
    }
  }
}

resource "docker_container" "grafana" {
  count   = 0
  image   = docker_image.grafana[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.GRAFANA_PORT_INT
    external = var.VARS.PORTS.DATABASES.GRAFANA_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}/config/${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}"
    container_path = "/etc/grafana/provisioning/datasources"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.GRAFANA_NAME}"
    container_path = "/var/lib/grafana"
  }
  user = "root"
}
