resource "kubernetes_namespace_v1" "metallb" {
  count = var.current.metallb.helm.enabled ? 1 : 0
  metadata {
    labels = {
      app = var.current.metallb.name
      "kubernetes.io/metadata.name" = var.current.metallb.namespace
    }
    name = var.current.metallb.namespace
  }
}

data "external" "metallb_namespace_dependency" {
   program = ["bash", "${path.module}/../../scripts/depends_on.sh", var.vars.CONSTANTS.KUBERNETES.RESOURCE.TYPE.NAMESPACE, var.current.metallb.namespace, ""]
}

resource "helm_release" "metallb" {
  count = var.current.metallb.helm.enabled && data.external.metallb_namespace_dependency.result.R == var.current.metallb.namespace ? 1 : 0

  name       = var.current.metallb.name
  namespace  = var.current.metallb.namespace
  repository = var.current.metallb.helm.repository
  chart      = var.current.metallb.helm.chart
  version    = var.current.metallb.helm.version
  
  atomic                     = local.override.atomic
  cleanup_on_fail            = local.override.cleanup_on_fail
  create_namespace           = false
  dependency_update          = local.override.dependency_update
  disable_crd_hooks          = local.override.disable_crd_hooks
  disable_openapi_validation = local.override.disable_openapi_validation
  disable_webhooks           = local.override.disable_webhooks
  force_update               = local.override.force_update
  lint                       = local.override.lint
  max_history                = local.override.max_history
  pass_credentials           = local.override.pass_credentials
  recreate_pods              = local.override.recreate_pods
  render_subchart_notes      = local.override.render_subchart_notes
  replace                    = local.override.replace
  reset_values               = local.override.reset_values
  reuse_values               = local.override.reuse_values
  skip_crds                  = local.override.skip_crds
  timeout                    = local.override.timeout
  verify                     = local.override.verify
  wait                       = local.override.wait
  wait_for_jobs              = local.override.wait_for_jobs
  
  values = [jsonencode(var.current.metallb.helm.values)]
}

data "external" "metallb_deployment_dependency" {
   program = ["bash", "${path.module}/../../scripts/depends_on.sh", var.vars.CONSTANTS.KUBERNETES.RESOURCE.TYPE.DEPLOYMENT, var.current.metallb.namespace, "${var.current.metallb.name}-controller"]
}

data "external" "metallb_ip_subnet" {
  program = ["bash", "${path.module}/../../scripts/metallb_ip_subnet.sh"]
}

resource "kubernetes_manifest" "ipaddresspool" {
  count = var.current.metallb.helm.enabled && data.external.metallb_deployment_dependency.result.R == "${var.current.metallb.name}-controller" ? 1 : 0
  depends_on = [ helm_release.metallb ]
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "${var.current.metallb.name}-ipaddresspool"
      namespace = var.current.metallb.namespace
    }
    spec = {
      addresses = [
        data.external.metallb_ip_subnet.result.R
      ]
    }
  }
}

resource "kubernetes_manifest" "l2advertisement" {
  count = var.current.metallb.helm.enabled && data.external.metallb_deployment_dependency.result.R == "${var.current.metallb.name}-controller" ? 1 : 0
  depends_on = [ helm_release.metallb ]
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "${var.current.metallb.name}-l2advertisement"
      namespace = var.current.metallb.namespace
    }
    spec = {
      ipAddressPools = [
        "${var.current.metallb.name}-ipaddresspool"
      ]
    }
  }
}
