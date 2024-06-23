resource "helm_release" "rabbitmq" {
  count = var.current.rabbitmq.helm.enabled ? 1 : 0

  name       = var.current.rabbitmq.name
  namespace  = var.current.rabbitmq.namespace
  repository = var.current.rabbitmq.helm.repository
  chart      = var.current.rabbitmq.helm.chart
  version    = var.current.rabbitmq.helm.version
  
  atomic                     = local.override.atomic
  cleanup_on_fail            = local.override.cleanup_on_fail
  create_namespace           = local.override.create_namespace
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
  
  values = [jsonencode(var.current.rabbitmq.helm.values)]
}