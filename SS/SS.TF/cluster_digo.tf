provider "digitalocean" {
  alias = "main"
}

provider "helm" {
  alias = "digitalocean"
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "digitalocean_cluster" {
  count     = local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_DIGO ? 1 : 0
  providers = {digitalocean = digitalocean.main}
  source    = "./digo"
  vars      = local.vars
}

data "external" "digitalocean_cluster" { program = ["bash", "${path.module}/scripts/depends_on.sh", "deployment", "kube-system", "coredns"] }
module "digitalocean_helm" {
  providers = {helm = helm.digitalocean}
  count     = local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_DIGO && data.external.current_context.result.R == local.vars.WORKSPACE ? 1 : 0
  source    = "./app/helm"
  vars      = local.vars
  current   = local.current
}