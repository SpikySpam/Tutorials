output "PREFIX" {
  value = var.PREFIX
}
output "PROVIDER" {
  value = var.PROVIDER
}
output "ENVIRONMENT" {
  value = var.ENVIRONMENT
}
output "REGION" {
  value = var.REGION
}
output "HOST" {
  value = var.HOST
}
output "DOMAIN" {
  value = local.DOMAIN
}
output "CLUSTERNAME" {
  value = local.CLUSTERNAME
}
output "WORKSPACE" {
  value = terraform.workspace
}
