terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/tehcyx/kind/latest
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1" # TF_VAR_VERSION_TF_KIND
      configuration_aliases = [kind.main]
    }
    # ➡️ https://registry.terraform.io/providers/digitalocean/digitalocean/latest
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.38.0" # TF_VAR_VERSION_TF_DO
      configuration_aliases = [digitalocean.main]
    }

    # ➡️ https://registry.terraform.io/providers/kreuzwerker/docker/latest
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2" # TF_VAR_VERSION_TF_DOCKER
      configuration_aliases = [docker.main]
    }
    # ➡️ https://registry.terraform.io/providers/hashicorp/helm/latest
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2" # TF_VAR_VERSION_TF_HELM
      configuration_aliases = [helm.kind, helm.digitalocean]
    }

    # ➡️ https://registry.terraform.io/providers/hashicorp/external/latest
    external = {
      source  = "hashicorp/external"
      version = "2.3.3" # TF_VAR_VERSION_TF_EXTERNAL
    }    
  }
}
