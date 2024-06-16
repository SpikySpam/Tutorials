resource "docker_image" "dashy" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.DASHY_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_DASHY}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.DASHY_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_DASHY}"
    }
  }
}

resource "docker_container" "dashy" {
  count   = 0
  image   = docker_image.dashy[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.DASHY_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.DASHY_PORT_INT
    external = var.vars.PORTS.TOOLS.DASHY_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.DASHY_NAME}"
    container_path = "/data"
  }
  env = [
    "NODE_ENV=production",
    "UID=1000",
    "GID=1000",
  ] 
}
