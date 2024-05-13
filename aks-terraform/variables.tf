variable "client_id" {
  description = "Access key for the provider"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Secret key for the provider"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Identifies Azure subscription"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = " Identifies which Azure AD instance the application sits under"
  type        = string
  sensitive   = true
}

