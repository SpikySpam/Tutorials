resource "docker_image" "vault" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.SECURITY.VAULT_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_VAULT}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.SECURITY.VAULT_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_VAULT}"
    }
  }
}

resource "docker_container" "vault" {
  count   = 0
  image   = docker_image.vault[0].image_id
  name    = "${var.VARS.SECRETS.SECURITY.VAULT_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.SECURITY.VAULT_PORT_INT
    external = var.VARS.PORTS.SECURITY.VAULT_PORT_EXT
  }
  volumes {
    host_path = "${var.VARS.PATHS.PATH_HOME}/docker/${var.VARS.SECRETS.SECURITY.VAULT_NAME}"
    container_path = "/data"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  env = [
    "VAULT_ADDR='https://0.0.0.0:${var.VARS.PORTS.SECURITY.VAULT_PORT_INT}'",
    "VAULT_LOCAL_CONFIG={\"listener\": [{\"tcp\":{\"address\": \"0.0.0.0:${var.VARS.PORTS.SECURITY.VAULT_PORT_INT}\",\"tls_disable\":\"1\"}}], \"default_lease_ttl\": \"168h\", \"max_lease_ttl\": \"720h\"}, \"ui\": true}",
    "VAULT_DEV_ROOT_TOKEN_ID=${var.VARS.SECRETS.SECURITY.VAULT_TOKEN_ROOT}",
    "VAULT_TOKEN=${var.VARS.SECRETS.SECURITY.VAULT_TOKEN_USER}",
  ]
  command = [
    "server",
    "-dev",
    "-dev-root-token-id=${var.VARS.SECRETS.SECURITY.VAULT_TOKEN_ROOT}",
  ]  
}
