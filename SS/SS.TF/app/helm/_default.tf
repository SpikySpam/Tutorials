locals {
  default = {
    atomic                     = false
    cleanup_on_fail            = false
    create_namespace           = false
    dependency_update          = false
    disable_crd_hooks          = false
    disable_openapi_validation = false
    disable_webhooks           = false
    force_update               = false
    lint                       = false
    max_history                = 0
    pass_credentials           = false
    recreate_pods              = false
    render_subchart_notes      = true
    replace                    = false
    reset_values               = false
    reuse_values               = false
    skip_crds                  = false
    timeout                    = 300
    verify                     = false
    wait                       = true
    wait_for_jobs              = false
  }
  override = {
    atomic                     = local.default.atomic
    cleanup_on_fail            = true
    create_namespace           = true
    dependency_update          = local.default.dependency_update
    disable_crd_hooks          = local.default.disable_crd_hooks
    disable_openapi_validation = local.default.disable_openapi_validation
    disable_webhooks           = local.default.disable_webhooks
    force_update               = local.default.force_update
    lint                       = local.default.lint
    max_history                = local.default.max_history
    pass_credentials           = local.default.pass_credentials
    recreate_pods              = local.default.recreate_pods
    render_subchart_notes      = local.default.render_subchart_notes
    replace                    = local.default.replace
    reset_values               = local.default.reset_values
    reuse_values               = local.default.reuse_values
    skip_crds                  = local.default.skip_crds
    timeout                    = 600
    verify                     = local.default.verify
    wait                       = false
    wait_for_jobs              = local.default.wait_for_jobs
  }
}
