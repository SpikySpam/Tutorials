resource "docker_image" "prometheus" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PROMETHEUS}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_PROMETHEUS}"
    }
  }
}

resource "docker_container" "prometheus" {
  count   = 0
  image   = docker_image.prometheus[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.PROMETHEUS_PORT_INT
    external = var.vars.PORTS.DATABASES.PROMETHEUS_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}"
    container_path = "/prometheus"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}/config/${var.vars.SECRETS.DATABASES.PROMETHEUS_NAME}"
    container_path = "/etc/prometheus"
  }
  command = [
    "--web.enable-lifecycle",
    "--config.file=/etc/prometheus/prometheus.yml",
  ]
  user = "root"
}
