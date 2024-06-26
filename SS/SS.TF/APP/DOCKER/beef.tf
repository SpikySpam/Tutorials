resource "docker_image" "beef" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.HACK.BEEF_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_BEEF}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.HACK.BEEF_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_RUBY}"
    }
  }
}

resource "docker_container" "beef" {
  count   = 0
  image   = docker_image.beef[0].image_id
  name    = "${var.vars.SECRETS.HACK.BEEF_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.HACK.BEEF_PORT_INT_3000
    external = var.vars.PORTS.HACK.BEEF_PORT_EXT_3000
  }
  ports {
    internal = var.vars.PORTS.HACK.BEEF_PORT_INT_6789
    external = var.vars.PORTS.HACK.BEEF_PORT_EXT_6789
  }
  ports {
    internal = var.vars.PORTS.HACK.BEEF_PORT_INT_61985
    external = var.vars.PORTS.HACK.BEEF_PORT_EXT_61985
  }
  ports {
    internal = var.vars.PORTS.HACK.BEEF_PORT_INT_61986
    external = var.vars.PORTS.HACK.BEEF_PORT_EXT_61986
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.HACK.BEEF_NAME}"
    container_path = "/data"
  }
  env = [
    "BEEF_WAITTIME=0",
    "BEEF_DEBUG=false",
    "BEEF_USER=${var.vars.SECRETS.HACK.BEEF_USER}",
    "BEEF_PASSWORD=${var.vars.SECRETS.HACK.BEEF_PASSWORD}",
    "BEEF_SSL=false",
    "BEEF_PUBLIC_IP=${var.vars.SECRETS.HACK.BEEF_NAME}.${var.vars.DOMAIN}",
    "BEEF_PUBLIC_PORT=${var.vars.PORTS.HACK.BEEF_PORT_EXT_3000}",
    "BEEF_SSL_PUBLIC=false",
    "BEEF_MSF_ENABLE=false",
    "MSF_RPC_HOST=0.0.0.0",
    "MSF_RPC_PORT=55553",
    "MSF_RPC_USER=${var.vars.SECRETS.HACK.BEEF_USER}",
    "MSF_RPC_PASS=${var.vars.SECRETS.HACK.BEEF_PASSWORD}",
    "MSF_RPC_SSL=true",
    "MSF_SSL_VERIFY=false",
    "MSF_CALLBACK_HOST=${var.vars.SECRETS.HACK.BEEF_NAME}.${var.vars.DOMAIN}",
    "BEEF_SE_ENABLE=false",
    "SE_POSH_HOST=${var.vars.SECRETS.HACK.BEEF_NAME}.${var.vars.DOMAIN}",
    "SE_POSH_PORT=4343",
    "BEEF_EMAIL_ENABLE=false",
    "BEEF_EMAIL_TO=${var.vars.SECRETS.NETWORK.MAILINABOX_USER}",
    "BEEF_EMAIL_FROM=${var.vars.SECRETS.HACK.BEEF_NAME}@${var.vars.DOMAIN}",
    "BEEF_EMAIL_HOST=${var.vars.SECRETS.SMTP.SMTP_HOST}",
    "BEEF_EMAIL_PORT=${var.vars.SECRETS.SMTP.SMTP_PORT}",
    "BEEF_PHISHINGFRENZY_ENABLE=false"
  ]
}
