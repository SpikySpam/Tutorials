resource "docker_image" "proxy_docker_hub" {
  name = "registry:2.8.3"
}

resource "docker_container" "proxy_docker_hub" {
  image   = docker_image.proxy_docker_hub.image_id
  name    = "proxy-docker-hub"
  restart = "unless-stopped"
  networks_advanced {
    name = "kind"
  }
  env = [
    "REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io",
  ]
  lifecycle {
    ignore_changes = [
      command,
      cpu_shares,
      dns,
      dns_opts,
      dns_search,
      entrypoint,
      group_add,
      hostname,
      id,
      init,
      ipc_mode,
      log_driver,
      log_opts,
      max_retry_count,
      memory,
      memory_swap,
      network_mode,
      privileged,
      publish_all_ports,
      runtime,
      security_opts,
      shm_size,
      stop_timeout,
      storage_opts,
      sysctls,
      tmpfs,
    ]
  }
}
