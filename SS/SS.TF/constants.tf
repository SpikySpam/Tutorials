# --------------------------------------------------
# 🏭 PREFIX
# --------------------------------------------------
variable "PREFIX_NONE" {
  type = string
}
variable "PREFIX_CTRL" {
  type = string
}

# --------------------------------------------------
# 🌐 PROVIDER
# --------------------------------------------------
variable "PROVIDER_KIND" {
  type = string
}
variable "PROVIDER_DIGO" {
  type = string
}
variable "PROVIDER_VULT" {
  type = string
}
variable "PROVIDER_CIVO" {
  type = string
}
variable "PROVIDER_LINO" {
  type = string
}
variable "PROVIDER_GOOG" {
  type = string
}
variable "PROVIDER_AZUR" {
  type = string
}
variable "PROVIDER_AMWS" {
  type = string
}

# --------------------------------------------------
# 💻 ENVIRONMENT
# --------------------------------------------------
variable "ENVIRONMENT_DEV" {
  type = string
}
variable "ENVIRONMENT_PRD" {
  type = string
}

# --------------------------------------------------
# 📍 REGION
# --------------------------------------------------
variable "REGION_NONE" {
  type = string
}

# --------------------------------------------------
# 🌍 HOST
# --------------------------------------------------
variable "HOST_EXAMPLE" {
  type = string
}
variable "HOST_SPIKYSPAM" {
  type = string
}