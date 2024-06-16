resource "docker_image" "grafana" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.GRAFANA_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GRAFANA}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.GRAFANA_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_GRAFANA}"
    }
  }
}

resource "docker_container" "grafana" {
  count   = 0
  image   = docker_image.grafana[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.GRAFANA_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.GRAFANA_PORT_INT
    external = var.vars.PORTS.DATABASES.GRAFANA_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.GRAFANA_NAME}/config/${var.vars.SECRETS.DATABASES.GRAFANA_NAME}"
    container_path = "/etc/grafana/provisioning/datasources"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.GRAFANA_NAME}"
    container_path = "/var/lib/grafana"
  }
  user = "root"
}
