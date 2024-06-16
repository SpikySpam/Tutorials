output "endpoint" {
  value = kind_cluster.current.endpoint
}

output "ca_certificate" {
  value = kind_cluster.current.cluster_ca_certificate
}

output "client_key" {
  value = kind_cluster.current.client_key
}

output "client_certificate" {
  value = kind_cluster.current.client_certificate
}

output "kubeconfig" {
  value = kind_cluster.current.kubeconfig
}