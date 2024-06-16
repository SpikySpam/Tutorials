resource "digitalocean_kubernetes_cluster" "current" {
  name          = var.vars.CLUSTERNAME
  region        = var.vars.REGION
  version       = var.vars.VERSIONS.CLUSTER.VERSION_CLUSTER_DO
  auto_upgrade  = false
  surge_upgrade = false
  ha            = false

  node_pool {
    name       = "${var.vars.CLUSTERNAME}-default-pool"
    size       = "s-2vcpu-4g"
    node_count = 1
    auto_scale = false
    min_nodes  = 1
    max_nodes  = 1
  }

  # doctl auth init -t ""
  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = <<EOT
                  doctl kubernetes cluster kubeconfig save ${var.vars.CLUSTERNAME}
                  octant >/dev/null 2>&1 &
                  EOT
  }

  lifecycle {
    ignore_changes = [node_pool[0].node_count]
  }
}

# resource "digitalocean_kubernetes_node_pool" "pool" {
#   count      = 0
#   cluster_id = digitalocean_kubernetes_cluster.current.id
#   name       = "${var.vars.CLUSTERNAME}-pool-${count.index}"
#   size       = var.default_node_pool_size
#   node_count = var.default_node_pool_node_count
#   auto_scale = var.default_node_pool_auto_scale
#   min_nodes  = var.default_node_pool_min_nodes
#   max_nodes  = var.default_node_pool_max_nodes
# }
