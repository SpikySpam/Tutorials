locals {
  provider = local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_KIND ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # kind.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # kind.dev.ctrl
      } : {

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # kind.prd.
        nginx = {
          helm = {
            enabled = true
            values = {
              controller = {
                service = {
                  type = local.vars.CONSTANTS.KUBERNETES.SERVICE.TYPE.NODEPORT
                }
              }
            }
          }
        }

        # rabbitmq = {
        #   helm = {
        #     enabled = true
        #   }
        # }

      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # kind.prd.ctrl
      } : {

      }
    } : { 

   }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_DIGO ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # digo.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # digo.dev.ctrl
      } : { 

     }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # digo.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # digo.prd.ctrl
      } : { 

     }
    } : {

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_VULT ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # vult.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # vult.dev.ctrl
      } : { 

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # vult.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # vult.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_CIVO ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # civo.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # civo.dev.ctrl
      } : { 

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # civo.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # civo.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_LINO ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # lino.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # lino.dev.ctrl
      } : { 

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # lino.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # lino.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_GOOG ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # goog.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # goog.dev.ctrl
      } : { 

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # goog.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # goog.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_AZUR ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # azur.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # azur.dev.ctrl
      } : { 

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # azur.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # azur.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : local.vars.PROVIDER == local.vars.CONSTANTS.PROVIDER.PROVIDER_AMWS ? {
    environment = local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_DEV ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # aws.dev.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # aws.dev.ctrl
      } : {

      }
    } : local.vars.ENVIRONMENT == local.vars.CONSTANTS.ENVIRONMENT.ENVIRONMENT_PRD ? {
      prefix = local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_NONE ? { 
        # aws.prd.
      } : local.vars.PREFIX == local.vars.CONSTANTS.PREFIX.PREFIX_CTRL ? { 
        # aws.prd.ctrl
      } : { 

      }
    } : { 

    }
  } : {

  } 
}

