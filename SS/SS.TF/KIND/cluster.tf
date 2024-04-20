# locals {
#   containerd_config_patches = [
#     <<INIT
#       [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
#         endpoint = ["http://proxy-docker-hub:5000"]
#     INIT
#     ,
#     <<INIT
#       [plugins."io.containerd.grpc.v1.cri".registry.mirrors."quay.io"]
#         endpoint = ["http://proxy-quay:5000"]
#     INIT
#     ,
#     <<INIT
#       [plugins."io.containerd.grpc.v1.cri".registry.mirrors."k8s.gcr.io"]
#         endpoint = ["http://proxy-k8s-gcr:5000"]
#     INIT
#     ,
#     <<INIT
#       [plugins."io.containerd.grpc.v1.cri".registry.mirrors."gcr.io"]
#         endpoint = ["http://proxy-gcr:5000"]
#     INIT
#     ,
#   ]

#   extra_port_mappings = toset([
#     {
#       container_port = 80
#       host_port      = 80
#       listen_address = "127.0.0.1"
#       protocol       = "TCP"
#     },
#     {
#       container_port = 443
#       host_port      = 443
#       listen_address = "127.0.0.1"
#       protocol       = "TCP"
#     },
#   ])

#   workers = split(",", var.workers)
# }

# resource "kind_cluster" "current" {
#   provider        = kind.main
#   kubeconfig_path = pathexpand("~/.kube/config")
#   name            = var.vars.clustername
#   node_image      = var.node_image
#   wait_for_ready  = true

#   kind_config {
#     kind        = "Cluster"
#     api_version = "kind.x-k8s.io/v1alpha4"

#     networking {
#        disable_default_cni = false
#        kube_proxy_mode     = "iptables"
#     }

#     containerd_config_patches = local.containerd_config_patches
#     node {
#       role = "control-plane"
#       dynamic "extra_port_mappings" {
#         for_each = local.extra_port_mappings
#         iterator = mapping
#         content {
#           container_port = mapping.value.container_port
#           host_port      = mapping.value.host_port
#           listen_address = mapping.value.listen_address
#           protocol       = mapping.value.protocol
#         }
#       }
#       dynamic "extra_mounts" {
#         for_each = local.extra_mounts_control
#         iterator = mapping
#         content {
#           container_path = mapping.value.container_path
#           host_path      = mapping.value.host_path
#         }
#       }
#     }
#     dynamic "node" {
#       for_each = local.workers
#       iterator = i
#       content {
#         role = i.value
#         dynamic "extra_mounts" {
#           for_each = local.extra_mounts_control
#           iterator = mapping
#           content {
#             container_path = mapping.value.container_path
#             host_path      = mapping.value.host_path
#           }
#         }
#         extra_mounts {
#           container_path = "/persistence"
#           host_path      =  "${var.vars.env.home}/kind/${var.vars.clustername}"
#         }
#       }
#     }
#   }

#   provisioner "local-exec" {
#     interpreter = ["bash", "-c"]
#     command     = <<EOT
#                   kubectl cluster-info --context ${var.vars.workspace}
#                   octant >/dev/null 2>&1 &
#                   EOT
#   }
# }
