resource "docker_image" "traefik" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.NETWORK.TRAEFIK_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_TRAEFIK}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.NETWORK.TRAEFIK_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_TRAEFIK}"
    }
  }
}

resource "docker_container" "traefik" {
  count   = 0
  image   = docker_image.traefik[0].image_id
  name    = "${var.VARS.SECRETS.NETWORK.TRAEFIK_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_INT_80
    external = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_EXT_80
  }
  ports {
    internal = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_INT_443
    external = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_EXT_443
  }
  ports {
    internal = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_INT_8080
    external = var.VARS.PORTS.SECURITY.TRAEFIK_PORT_EXT_8080
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.NETWORK.TRAEFIK_NAME}/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  command = [
    "--api.insecure=true",
    "--providers.docker=true",
    "--providers.docker.exposedbydefault=false",
    "--entrypoints.web.address=:${var.VARS.PORTS.SECURITY.TRAEFIK_PORT_INT_80}",
  ]  
}
