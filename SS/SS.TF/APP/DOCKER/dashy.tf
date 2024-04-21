resource "docker_image" "dashy" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.DASHY_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_DASHY}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.DASHY_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_DASHY}"
    }
  }
}

resource "docker_container" "dashy" {
  count   = 0
  image   = docker_image.dashy[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.DASHY_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.DASHY_PORT_INT
    external = var.VARS.PORTS.TOOLS.DASHY_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.DASHY_NAME}"
    container_path = "/data"
  }
  env = [
    "NODE_ENV=production",
    "UID=1000",
    "GID=1000",
  ] 
}
