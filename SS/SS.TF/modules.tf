module "kind_cluster" {
  providers = {kind.main = kind.main}
  source    = "./KIND"
  VARS      = local.VARS
}