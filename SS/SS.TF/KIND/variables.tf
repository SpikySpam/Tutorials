locals {
    
}

# 🌐 Workspace
variable "PREFIX" {
  type = string
  description = "Define a prefix. This normally is the name of a customer and will be part of the subdomain"
}
variable "PROVIDER" {
  type = string
  description = "Define a provider to use (kind, digo, vult, civo, lino, goog, azur, amws)"
}
variable "ENVIRONMENT" {
  type = string
  description = "Define your environment. (dev, prd)"
}
variable "REGION" {
  type = string
  description = "Define your region. This option is provider specific"
}




export TF_VAR_PREFIX=$PARAM_PREFIX
export TF_VAR_PROVIDER=$PARAM_PROVIDER
export TF_VAR_ENVIRONMENT=$PARAM_ENVIRONMENT
export TF_VAR_REGION=$PARAM_REGION
export TF_VAR_DOMAIN=$POINT_PREFIX$POINT_ENVIRONMENT$TF_VAR_HOST
export TF_VAR_CLUSTERNAME=$STRIP_PREFIX$STRIP_REGION$PARAM_ENVIRONMENT
export TF_WORKSPACE=$TF_VAR_PROVIDER-$TF_VAR_CLUSTERNAME