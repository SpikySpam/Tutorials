terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/hashicorp/helm/latest
    helm = {
      source = "hashicorp/helm"
    }
  }
}

variable "vars" { }
variable "current" { }