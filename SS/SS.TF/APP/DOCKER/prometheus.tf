resource "docker_image" "prometheus" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PROMETHEUS}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_PROMETHEUS}"
    }
  }
}

resource "docker_container" "prometheus" {
  count   = 0
  image   = docker_image.prometheus[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.PROMETHEUS_PORT_INT
    external = var.VARS.PORTS.DATABASES.PROMETHEUS_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}"
    container_path = "/prometheus"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}/config/${var.VARS.SECRETS.DATABASES.PROMETHEUS_NAME}"
    container_path = "/etc/prometheus"
  }
  command = [
    "--web.enable-lifecycle",
    "--config.file=/etc/prometheus/prometheus.yml",
  ]
  user = "root"
}
