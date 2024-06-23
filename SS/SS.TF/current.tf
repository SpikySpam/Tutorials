data "external" "current_context" {
  program = ["bash", "${path.root}/scripts/current_context.sh"]
}

locals {
  current = {

    metallb = {
      name = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).name, var.METALLB_NAME)
      namespace = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).namespace, "${var.METALLB_NAME}-system")
      helm = {
        enabled    = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).helm.enabled, false)
        chart      = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).helm.chart, "metallb")
        repository = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).helm.repository, "https://metallb.github.io/metallb")
        version    = try(lookup(local.provider.environment.prefix.config, var.METALLB_NAME).helm.version, var.VERSION_HELM_METALLB)
        values = {
          controller = {
            image = {
              tag = try("v${lookup(local.provider.environment.prefix.config, var.METALLB_NAME).helm.values.controller.image.tag}", "v${var.VERSION_DOCKER_METALLB}")
            }
          }
          speaker = {
            memberlist = {
              enabled = false
            }
            frr = {
              enabled = false
            }
          }
        }
      }
    }

    nginx = {
      name = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).name, "ingress-${var.NGINX_NAME}")
      namespace = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).namespace, "ingress-${var.NGINX_NAME}")
      ports = {
        internal = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).ports.internal, var.NGINX_PORT_INT)
        external = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).ports.external, var.NGINX_PORT_EXT)
      }
      docker = {
        enabled = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).docker.enabled, false)
        version = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).docker.version, var.VERSION_DOCKER_NGINX)
      }
      helm = {
        enabled    = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.enabled, false)
        chart      = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.chart, "ingress-${var.NGINX_NAME}")
        repository = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.repository, "https://kubernetes.github.io/ingress-nginx")
        version    = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.version, var.VERSION_HELM_NGINX)
        values = {
          controller = {
            image = {
              tag = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.controller.image.tag, var.VERSION_DOCKER_NGINX)
            }
            replicaCount = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.controller.replicaCount, 1)
            service = {
              type = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.controller.service.type, local.vars.CONSTANTS.KUBERNETES.SERVICE.TYPE.LOADBALANCER)
              annotations = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.controller.service.annotations, {})
            }
            hostPort = {
              enabled = true
            }
            nodeSelector = {
               ingress-ready = "true"
            }
            tolerations = [
              {
                key = "node-role.kubernetes.io/master"
                operator = "Equal"
                effect = "NoSchedule"
              },
              {
                key = "node-role.kubernetes.io/control-plane"
                operator = "Equal"
                effect = "NoSchedule"
              }
            ]
          }
          config = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.config, {})
          resources = {
            limits = {
              cpu = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.resources.limits.cpu, "50m") 
              memory = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.resources.limits.memory, "300M") 
            }
            requests = {
              cpu = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.resources.limits.cpu, "25m") 
              memory = try(lookup(local.provider.environment.prefix.config, var.NGINX_NAME).helm.values.resources.limits.memory, "150M") 
            }
          }
        }
      }
    }

    rabbitmq = {
      name = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).name, var.RABBITMQ_NAME)
      namespace = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).namespace, var.RABBITMQ_NAME)
      ports = {
        node = {
          internal = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).ports.node.internal, var.RABBITMQ_PORT_INT_NODE)
          external = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).ports.node.external, var.RABBITMQ_PORT_EXT_NODE)
        }        
        dist = {
          internal = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).ports.dist.internal, var.RABBITMQ_PORT_INT_DIST)
          external = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).ports.dist.external, var.RABBITMQ_PORT_EXT_DIST)
        } 
      }
      docker = {
        enabled = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).docker.enabled, false)
        version = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).docker.version, var.VERSION_DOCKER_RABBITMQ)
      }
      helm = {
        enabled    = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).helm.enabled, false)
        chart      = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).helm.chart, var.RABBITMQ_NAME)
        repository = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).helm.repository, local.vars.CONSTANTS.HELM.REPOSITORY.BITNAMI)
        version    = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).helm.version, var.VERSION_HELM_RABBITMQ)
        values = {
          persistence = {
            enabled = false
          }
          ingress = {
            enabled = true
            hostname = "${var.RABBITMQ_NAME}.${local.vars.HOST}"
          }
          auth = {
            username = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).env.user, var.RABBITMQ_USER)
            password = try(lookup(local.provider.environment.prefix.config, var.RABBITMQ_NAME).env.password, var.RABBITMQ_PASSWORD)
          }
          readinessProbe = {
            initialDelaySeconds = 60
          }
        }
      }
    }
  }
}
