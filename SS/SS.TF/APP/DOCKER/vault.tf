resource "docker_image" "vault" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.current.vault.name}:${var.current.vault.docker.version}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.current.vault.name}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.current.vault.docker.version}"
    }
  }
}

resource "docker_container" "vault" {
  count   = 0
  image   = docker_image.vault[0].image_id
  name    = "${var.current.vault.name}"
  restart = "unless-stopped"
  ports {
    internal = var.current.vault.ports.internal
    external = var.current.vault.ports.external
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.current.vault.name}"
    container_path = "/data"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  env = [
    "VAULT_ADDR='https://0.0.0.0:${var.current.vault.ports.internal}'",
    "VAULT_LOCAL_CONFIG={\"listener\": [{\"tcp\":{\"address\": \"0.0.0.0:${var.current.vault.ports.internal}\",\"tls_disable\":\"1\"}}], \"default_lease_ttl\": \"168h\", \"max_lease_ttl\": \"720h\"}, \"ui\": true}",
    "VAULT_DEV_ROOT_TOKEN_ID=${var.current.vault.env.token_root}",
    "VAULT_TOKEN=${var.current.vault.env.token_user}",
  ]
  command = [
    "server",
    "-dev",
    "-dev-root-token-id=${var.current.vault.env.token_root}",
  ]  
}
