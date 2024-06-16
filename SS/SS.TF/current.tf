data "external" "current_context" {
  program = ["bash", "${path.root}/scripts/current_context.sh"]
}

locals {
  current = {

    nginx = {
      name = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).name, var.NGINX_NAME)
      ports = {
        internal = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).ports.internal, var.NGINX_PORT_INT)
        external = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).ports.external, var.NGINX_PORT_EXT)
      }
      docker = {
        enabled = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).docker.enabled, false)
        version = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).docker.version, var.VERSION_DOCKER_NGINX)
      }
      helm = {
        enabled    = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.enabled, false)
        chart      = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.chart, "ingress-nginx")
        repository = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.repository, "https://kubernetes.github.io/ingress-nginx")
        version    = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.version, var.VERSION_HELM_NGINX)
        values     = {
          controller = {
            image = {
              tag = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.image.tag, var.VERSION_DOCKER_NGINX)
            }
            replicaCount = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.replicaCount, 1)
            allowSnippetAnnotations = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.allowSnippetAnnotations, true)
            service = {
              externalTrafficPolicy = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.service.externalTrafficPolicy, "Local") # CLuster
              type = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.service.type, local.vars.CONSTANTS.KUBERNETES.SERVICE.TYPE.LOADBALANCER)
              annotations = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.controller.service.annotations, {})
            }
          }
          config = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.config, {})
          defaultBackend = {
            enabled = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.defaultBackend.enabled, true)
            replicaCount = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.defaultBackend.replicaCount, 1)
          }
          resources = {
            limits = {
              cpu = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.resources.limits.cpu, "50m") 
              memory = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.resources.limits.memory, "300M") 
            }
            requests = {
              cpu = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.resources.limits.cpu, "25m") 
              memory = try(lookup(local.provider.environment.prefix, var.NGINX_NAME).helm.values.resources.limits.memory, "150M") 
            }
          }
        }
      }
    }

    rabbitmq = {
      name = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).name, var.RABBITMQ_NAME)
      ports = {
        node = {
          internal = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).ports.node.internal, var.RABBITMQ_PORT_INT_NODE)
          external = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).ports.node.external, var.RABBITMQ_PORT_EXT_NODE)
        }        
        dist = {
          internal = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).ports.dist.internal, var.RABBITMQ_PORT_INT_DIST)
          external = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).ports.dist.external, var.RABBITMQ_PORT_EXT_DIST)
        } 
      }
      env = {
        user = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).env.user, var.RABBITMQ_USER)
        password = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).env.password, var.RABBITMQ_PASSWORD)
      }
      docker = {
        enabled = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).docker.enabled, false)
        version = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).docker.version, var.VERSION_DOCKER_RABBITMQ)
      }
      helm = {
        enabled = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).helm.enabled, false)
        chart = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).helm.chart, var.RABBITMQ_NAME)
        repository = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).helm.repository, local.vars.CONSTANTS.HELM.REPOSITORY.BITNAMI)
        version = try(lookup(local.provider.environment.prefix, var.RABBITMQ_NAME).helm.version, var.VERSION_HELM_RABBITMQ)
      }
    }

  }
}
