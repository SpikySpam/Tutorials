resource "docker_image" "code-server" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CODESERVER}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_CODESERVER}"
      GITHUB_USER = "${var.VARS.SECRETS.PROVIDERS.GITHUB_USER}"
      GITHUB_EMAIL = "${var.VARS.SECRETS.PROVIDERS.GITHUB_EMAIL}"
    }
  }
}

resource "docker_container" "code-server" {
  count   = 0
  image   = docker_image.code-server[0].image_id
  name    = "${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DEVELOPMENT.CODESERVER_PORT_INT
    external = var.VARS.PORTS.DEVELOPMENT.CODESERVER_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_NAME}"
    container_path = "/config"
  }
  env = [
    "PUID=1000",
    "PGID=1000",
    "TZ=${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_TZ}",
    "PASSWORD=${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_PASSWORD}",
    "SUDO_PASSWORD=${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_PASSWORD}",
    "PROXY_DOMAIN=${var.VARS.SECRETS.DEVELOPMENT.CODESERVER_NAME}.${var.VARS.DOMAIN}",
    "DEFAULT_WORKSPACE=/config/workspace",
  ]
  user = "root"
  privileged = true
  stdin_open = true
  tty = true
}
