locals {
  DOMAIN      = "${var.PREFIX != var.PREFIX_NONE ? "${var.PREFIX}." : var.PREFIX}${var.ENVIRONMENT != var.ENVIRONMENT_PRD ? "${var.ENVIRONMENT}." : ""}${var.HOST}"
  CLUSTERNAME = "${var.PREFIX != var.PREFIX_NONE ? "${var.PREFIX}-" : var.PREFIX}${var.REGION != var.REGION_NONE ? "${var.REGION}-" : ""}${var.ENVIRONMENT}"
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
variable "HOST" {
  type = string
  description = "Define your hostname"
}
