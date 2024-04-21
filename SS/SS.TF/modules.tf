# module "kind_cluster" {
#   providers = {kind.main = kind.main}
#   source    = "./kind"
#   VARS      = local.VARS
# }

module "app-docker" {
  providers = {docker.main = docker.main}
  source    = "./app/docker"
  VARS      = local.VARS
}
