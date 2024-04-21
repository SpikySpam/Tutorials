terraform {
  required_version = ">=1.8.1"
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      configuration_aliases = [kind.main]
    }
  }
}
