resource "docker_image" "stirling-pdf" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.STIRLINGPDF_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_STIRLINGPDF}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.STIRLINGPDF_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_STIRLINGPDF}"
    }
  }
}

resource "docker_container" "stirling-pdf" {
  count   = 0
  image   = docker_image.stirling-pdf[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.STIRLINGPDF_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.STIRLINGPDF_PORT_INT
    external = var.VARS.PORTS.TOOLS.STIRLINGPDF_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.STIRLINGPDF_NAME}/data"
    container_path = "/usr/share/tessdata"
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.STIRLINGPDF_NAME}/configs"
    container_path = "/configs"
  }
  env = [
    "DOCKER_ENABLE_SECURITY=false",
    "INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false",
    "LANGS=${var.VARS.SECRETS.TOOLS.STIRLINGPDF_LANG}",
  ]
}
