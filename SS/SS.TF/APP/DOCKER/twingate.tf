resource "docker_image" "twingate" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.SECURITY.TWINGATE_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_TWINGATE}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.SECURITY.TWINGATE_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_TWINGATE}"
    }
  }
}

resource "docker_container" "twingate" {
  count   = 0
  image   = docker_image.twingate[0].image_id
  name    = "${var.VARS.SECRETS.SECURITY.TWINGATE_NAME}"
  restart = "unless-stopped"
  sysctls = {
    "net.ipv4.ping_group_range" = "0 2147483647"
  }
  env = [
    "TENANT_URL=https://${var.VARS.SECRETS.SECURITY.TWINGATE_TENANT_NETWORK}.${var.VARS.SECRETS.SECURITY.TWINGATE_DOMAIN}",
    "ACCESS_TOKEN=${var.VARS.SECRETS.SECURITY.TWINGATE_ACCESS_TOKEN}",
    "REFRESH_TOKEN=${var.VARS.SECRETS.SECURITY.TWINGATE_REFRESH_TOKEN}",
    "TWINGATE_LABEL_HOSTNAME=${var.VARS.SECRETS.SECURITY.TWINGATE_LABEL_HOSTNAME}",
  ]
}
