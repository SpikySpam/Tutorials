resource "docker_image" "code-server" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DEVELOPMENT.CODESERVER_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CODESERVER}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_CODESERVER}"
      GITHUB_USER = "${var.vars.SECRETS.PROVIDERS.GITHUB_USER}"
      GITHUB_EMAIL = "${var.vars.SECRETS.PROVIDERS.GITHUB_EMAIL}"
    }
  }
}

resource "docker_container" "code-server" {
  count   = 0
  image   = docker_image.code-server[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.CODESERVER_PORT_INT
    external = var.vars.PORTS.DEVELOPMENT.CODESERVER_PORT_EXT
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
    container_path = "/config"
  }
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=${var.vars.SECRETS.DEVELOPMENT.CODESERVER_TZ}",
    "PASSWORD=${var.vars.SECRETS.DEVELOPMENT.CODESERVER_PASSWORD}",
    "SUDO_PASSWORD=${var.vars.SECRETS.DEVELOPMENT.CODESERVER_PASSWORD}",
    "PROXY_DOMAIN=${var.vars.SECRETS.DEVELOPMENT.CODESERVER_NAME}.${var.vars.DOMAIN}",
    "DEFAULT_WORKSPACE=/config/workspace",
  ]
  user = "root"
  privileged = true
  stdin_open = true
  tty = true
}
