locals {
  containerd_config_patches = [
    <<INIT
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors."docker.io"]
        endpoint = ["http://proxy-docker-hub:5000"]
    INIT
    ,
  ]

  kubeadm_config_patches = [
    <<INIT
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
    INIT
    ,
    <<INIT
    kind: ClusterConfiguration
    controllerManager:
      extraArgs:
        bind-address: 0.0.0.0
    etcd:
      local:
        extraArgs:
          listen-metrics-urls: http://0.0.0.0:2381
    scheduler:
      extraArgs:
        bind-address: 0.0.0.0
    INIT
    ,
    <<INIT
    kind: KubeProxyConfiguration
    metricsBindAddress: 0.0.0.0
    INIT
  ]

  extra_mounts_control = toset([
    {
      container_path = "/kind/manifests/default-storage.yaml"
      host_path      = "${path.module}/hostpath.yaml"
    },
  ])  

  extra_port_mappings = toset([
    {
      container_port = 80
      host_port      = 8080
      listen_address = "127.0.0.1"
      protocol       = "TCP"
    },
    {
      container_port = 443
      host_port      = 4430
      listen_address = "127.0.0.1"
      protocol       = "TCP"
    },
  ])

  nodes = split(",", "control-plane,worker,worker,worker")
}

resource "kind_cluster" "current" {
  kubeconfig_path = "${var.vars.PATHS.PATH_HOME}/.kube/config"
  name            = var.vars.CLUSTERNAME
  node_image      = "kindest/node:v${var.vars.VERSIONS.CLUSTER.VERSION_CLUSTER_KIND}"
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    networking {
       disable_default_cni = false
       kube_proxy_mode     = "iptables"
    }

    containerd_config_patches = local.containerd_config_patches
    node {
      role = "control-plane"
      kubeadm_config_patches = local.kubeadm_config_patches
      dynamic "extra_port_mappings" {
        for_each = local.extra_port_mappings
        iterator = mapping
        content {
          container_port = mapping.value.container_port
          host_port      = mapping.value.host_port
          listen_address = mapping.value.listen_address
          protocol       = mapping.value.protocol
        }
      }
      dynamic "extra_mounts" {
        for_each = local.extra_mounts_control
        iterator = mapping
        content {
          container_path = mapping.value.container_path
          host_path      = mapping.value.host_path
        }
      }
    }
    dynamic "node" {
      for_each = local.nodes
      iterator = i
      content {
        role = i.value
        dynamic "extra_mounts" {
          for_each = local.extra_mounts_control
          iterator = mapping
          content {
            container_path = mapping.value.container_path
            host_path      = mapping.value.host_path
          }
        }        
        extra_mounts {
          container_path = "/persistence"
          host_path      = "${var.vars.PATHS.PATH_HOME}/${var.vars.CONSTANTS.PROVIDER.PROVIDER_KIND}/${var.vars.CLUSTERNAME}"
        }
      }
    }
  }

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = <<EOT
                  kubectl cluster-info --context ${var.vars.WORKSPACE}
                  EOT
  }
}
