resource "docker_image" "searxng" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.SEARXNG_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_SEARXNG}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.SEARXNG_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_SEARXNG}"
    }
  }
}

resource "docker_container" "searxng" {
  count   = 0
  image   = docker_image.searxng[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.SEARXNG_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.SEARXNG_PORT_INT
    external = var.vars.PORTS.TOOLS.SEARXNG_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.SEARXNG_NAME}"
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
