resource "docker_image" "stirling-pdf" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.STIRLINGPDF_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_STIRLINGPDF}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.STIRLINGPDF_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_STIRLINGPDF}"
    }
  }
}

resource "docker_container" "stirling-pdf" {
  count   = 0
  image   = docker_image.stirling-pdf[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.STIRLINGPDF_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.STIRLINGPDF_PORT_INT
    external = var.vars.PORTS.TOOLS.STIRLINGPDF_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.STIRLINGPDF_NAME}/data"
    container_path = "/usr/share/tessdata"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.STIRLINGPDF_NAME}/configs"
    container_path = "/configs"
  }
  env = [
    "DOCKER_ENABLE_SECURITY=false",
    "INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false",
    "LANGS=${var.vars.SECRETS.TOOLS.STIRLINGPDF_LANG}",
  ]
}
