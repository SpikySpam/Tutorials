resource "docker_image" "elasticsearch" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_ELASTICSEARCH}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_ELASTICSEARCH}"
    }
  }
}

resource "docker_container" "elasticsearch" {
  count   = 0
  image   = docker_image.elasticsearch[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.ELASTICSEARCH_PORT_INT
    external = var.vars.PORTS.DATABASES.ELASTICSEARCH_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}"
    container_path = "/usr/share/elasticsearch/data"
  }
  env = [
    "ES_JAVA_OPTS=-Xms1g -Xmx1g",
    "node.name=${var.vars.SECRETS.DATABASES.ELASTICSEARCH_NAME}",
    "discovery.type=single-node",
    "xpack.security.enabled=true",
    "xpack.security.enrollment.enabled=true",
    "xpack.security.transport.ssl.enabled=false",
    "http.cors.enabled=true",
    "http.cors.allow-origin='*'",
  ]
}
