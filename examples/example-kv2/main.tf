module "vault-namespace" {
  source = "git@github.com:stoffee/terraform-hashicorp-vault-namespace.git"

  vault_addr  = "https://vault.mydomain.com:8200"
  namespace   = "MyCoolNewNamespace"
  vault_token = "vaulttoken.ijasdiawoskjnasdokijbnasd"

  #
  # KV2
  #
  kv2_enabled = true
}