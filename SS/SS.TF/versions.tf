terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/tehcyx/kind/latest
    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0" # TF_VAR_VERSION_TF_KIND
      configuration_aliases = [kind.main]
    }

    # ➡️ https://registry.terraform.io/providers/kreuzwerker/docker/latest
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2" # TF_VAR_VERSION_TF_DOCKER
      configuration_aliases = [docker.main]
    }
  }
}
