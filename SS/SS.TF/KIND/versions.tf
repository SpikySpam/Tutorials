terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/tehcyx/kind/latest
    kind = {
      source = "tehcyx/kind"
    }
    # ➡️ https://registry.terraform.io/providers/kreuzwerker/docker/latest
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

variable "vars" { }