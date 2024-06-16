terraform {
  required_version = ">=1.2.3"
  required_providers {
    # https://registry.terraform.io/providers/digitalocean/digitalocean/latest
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

variable "vars" { }