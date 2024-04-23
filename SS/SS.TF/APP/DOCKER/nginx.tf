resource "docker_image" "nginx" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.NETWORK.NGINX_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_NGINX}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.NETWORK.NGINX_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_NGINX}"
    }
  }
}

resource "docker_container" "nginx" {
  count   = 0
  image   = docker_image.nginx[0].image_id
  name    = "${var.VARS.SECRETS.NETWORK.NGINX_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.NETWORK.NGINX_PORT_INT
    external = var.VARS.PORTS.NETWORK.NGINX_PORT_EXT
  }
  env = [
    "NGINX_HOST=${var.VARS.DOMAIN}",
    "NGINX_PORT=${var.VARS.PORTS.NETWORK.NGINX_PORT_INT}",
  ]
}
