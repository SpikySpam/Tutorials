terraform {
  required_version = ">=1.8.1"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      configuration_aliases = [docker.main]
    }
  }
}

variable "VARS" { }