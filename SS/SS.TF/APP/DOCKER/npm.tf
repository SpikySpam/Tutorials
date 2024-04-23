resource "docker_image" "npm" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.NETWORK.NPM_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_NPM}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.NETWORK.NPM_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_NPM}"
    }
  }
}

resource "docker_container" "npm" {
  count   = 0
  image   = docker_image.npm[0].image_id
  name    = "${var.VARS.SECRETS.NETWORK.NPM_NAME}"
  restart = "unless-stopped"
  ports {
    internal = 80
    external = 80
  }
  ports {
    internal = 81
    external = 81
  }
  ports {
    internal = 443
    external = 443
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.NETWORK.NPM_NAME}/data"
    container_path = "/data"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.NETWORK.NPM_NAME}/letsencrypt"
    container_path = "/etc/letsencrypt"
  }
  env = [
    "PUID: 1000",
    "PGID: 1000",
  ]
}
