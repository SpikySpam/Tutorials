data "digitalocean_kubernetes_cluster" "current" {
  name = digitalocean_kubernetes_cluster.current.name
}

output "id" {
  value = data.digitalocean_kubernetes_cluster.current.id
}

output "endpoint" {
  value = data.digitalocean_kubernetes_cluster.current.endpoint
}

output "host" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].host
}

output "raw_config" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].raw_config
}

output "ca_certificate" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].cluster_ca_certificate
}

output "token" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].token
}

output "client_key" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].client_key
}

output "client_certificate" {
  value = data.digitalocean_kubernetes_cluster.current.kube_config[0].client_certificate
}
