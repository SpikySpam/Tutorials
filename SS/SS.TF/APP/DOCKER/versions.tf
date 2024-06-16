terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/kreuzwerker/docker/latest
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

variable "vars" { }
variable "current" { }