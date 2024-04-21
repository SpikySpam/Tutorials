# module "kind_cluster" {
#   providers = {kind.main = kind.main}
#   source    = "./KIND"
#   VARS      = local.VARS
# }

module "app-docker" {
  providers = {docker.main = docker.main}
  source    = "./APP/DOCKER"
  VARS      = local.VARS
}
