resource "docker_image" "filebrowser" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.TOOLS.FILEBROWSER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_FILEBROWSER}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.TOOLS.FILEBROWSER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_FILEBROWSER}"
    }
  }
}

resource "docker_container" "filebrowser" {
  count   = 0
  image   = docker_image.filebrowser[0].image_id
  name    = "${var.VARS.SECRETS.TOOLS.FILEBROWSER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.TOOLS.FILEBROWSER_PORT_INT
    external = var.VARS.PORTS.TOOLS.FILEBROWSER_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.TOOLS.FILEBROWSER_NAME}/files"
    container_path = "/srv"
  }
  env = [
    "PUID=1000",
    "PGID=1000",
  ]
  security_opts = [
    "no-new-privileges:true"
  ]
}
