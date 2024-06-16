resource "docker_image" "filebrowser" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.TOOLS.FILEBROWSER_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_FILEBROWSER}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.TOOLS.FILEBROWSER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_FILEBROWSER}"
    }
  }
}

resource "docker_container" "filebrowser" {
  count   = 0
  image   = docker_image.filebrowser[0].image_id
  name    = "${var.vars.SECRETS.TOOLS.FILEBROWSER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.TOOLS.FILEBROWSER_PORT_INT
    external = var.vars.PORTS.TOOLS.FILEBROWSER_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.TOOLS.FILEBROWSER_NAME}/files"
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
