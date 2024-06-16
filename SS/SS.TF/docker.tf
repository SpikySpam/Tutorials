provider "docker" {
  alias = "main"
}

module "docker" {
  providers = {docker = docker.main}
  source    = "./app/docker"
  vars      = local.vars
  current   = local.current
}
