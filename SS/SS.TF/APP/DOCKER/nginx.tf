resource "docker_image" "nginx" {
  count = var.current.nginx.docker.enabled ? 1 : 0
  name  = "${var.vars.DOMAIN}/${var.current.nginx.name}:${var.current.nginx.docker.version}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.current.nginx.name}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.current.nginx.docker.version}"
    }
  }
}

resource "docker_container" "nginx" {
  count   = var.current.nginx.docker.enabled ? 1 : 0
  image   = docker_image.nginx[0].image_id
  name    = "${var.current.nginx.name}"
  restart = "unless-stopped"
  ports {
    internal = var.current.nginx.ports.internal
    external = var.current.nginx.ports.external
  }
  env = [
    "NGINX_HOST=${var.vars.DOMAIN}",
    "NGINX_PORT=${var.current.nginx.ports.internal}",
  ]
}
