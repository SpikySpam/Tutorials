resource "docker_image" "jellyfin" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_JELLYFIN}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_JELLYFIN}"
    }
  }
}

resource "docker_container" "jellyfin" {
  count   = 0
  image   = docker_image.jellyfin[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.JELLYFIN_PORT_INT
    external = var.VARS.PORTS.TOOLS.JELLYFIN_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}/config"
    container_path = "/config"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}/cache"
    container_path = "/cache"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}/media"
    container_path = "/media"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.JELLYFIN_NAME}/media2"
    container_path = "/media2"
  }
}
