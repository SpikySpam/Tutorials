terraform {
  required_version = ">=1.8.1"
  required_providers {
    # ➡️ https://registry.terraform.io/providers/tehcyx/kind/latest
    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0" # TF_VAR_VERSION_TF_KIND
      configuration_aliases = [kind.main]
    }
  }
}
