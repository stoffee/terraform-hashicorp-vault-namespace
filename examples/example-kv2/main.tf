module "vault-namespace" {
  source  = "stoffee/vault-namespace/hashicorp//examples/example-all"
  version = ">= 0.1.9"
  # for local module usage
  #source = "../../"

  vault_addr  = var.vault_addr
  namespace   = var.namespace
  vault_token = var.vault_token

  #
  # KV2
  #
  kv2_enabled = true

  #
  # UserPass Auth
  #
  userpass_auth_enabled   = true
  userpass_user1          = var.userpass_user1
  userpass_user1_password = var.userpass_user1_password
  userpass_admin          = var.userpass_admin
  userpass_admin_password = var.userpass_admin_password
}

variable "namespace" {
  description = "New Vault Namespace to create"
}
variable "vault_token" {
  description = "Vault Admin Token"
}
variable "vault_addr" {
  description = "Vault URL"
}
variable "userpass_user1" {
  description = "Desired name of a user to add to Vault UserPass Auth"
  default     = "vaultuser"
}
variable "userpass_user1_password" {
  description = "Desired password of a user to add to Vault UserPass Auth"
  default     = "ChangeMe"
  sensitive   = true
}
variable "userpass_admin" {
  description = "Desired name of namespace admin user to add to Vault UserPass Auth"
  default     = "vaultnamespaceadmin"
}
variable "userpass_admin_password" {
  description = "Desired password of namespace admin user to add to Vault UserPass Auth"
  default     = null
  sensitive   = true
}