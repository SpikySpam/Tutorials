resource "docker_image" "searxng" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.SEARXNG_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_SEARXNG}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.SEARXNG_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_SEARXNG}"
    }
  }
}

resource "docker_container" "searxng" {
  count   = 0
  image   = docker_image.searxng[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.SEARXNG_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.SEARXNG_PORT_INT
    external = var.VARS.PORTS.TOOLS.SEARXNG_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.SEARXNG_NAME}"
    container_path = "/etc/searxng"
  }
  capabilities {
    drop = ["ALL"]
    add  = ["CHOWN", "SETGID", "SETUID", "DAC_OVERRIDE"]
  }
  log_driver = "json-file"
  log_opts = {
    "max-size" = "1m"
    "max-file" = "1"
  }
}
