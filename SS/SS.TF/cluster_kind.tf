provider "kind" {
  alias = "main"
}

provider "helm" {
  alias = "kind"
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "kind_cluster" {
  count     = local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_KIND ? 1 : 0
  providers = {kind = kind.main, docker = docker.main}
  source    = "./kind"
  vars      = local.vars
}

data "external" "kind_cluster" { program = ["bash", "${path.module}/scripts/depends_on.sh", "deployment", "kube-system", "coredns"] }
module "kind_helm" {
  providers = {helm = helm.kind}
  count     = local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_KIND && data.external.current_context.result.R == local.vars.WORKSPACE ? 1 : 0
  source    = "./app/helm"
  vars      = local.vars
  current   = local.current
}
