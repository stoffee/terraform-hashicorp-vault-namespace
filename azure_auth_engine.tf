resource "vault_auth_backend" "azure" {
  count = var.azure_auth_enabled ? 1 : 0
  type = "azure"  
  depends_on = [
    vault_namespace.new,
  ]
}

resource "vault_azure_auth_backend_config" "main" {
  count = var.azure_auth_enabled ? 1 : 0
  backend       = vault_auth_backend.azure[0].path
  tenant_id     = var.azure_auth_engine_tenant_id
  client_id     = var.azure_auth_engine_client_id
  client_secret = var.azure_auth_engine_client_secret
  resource      = var.azure_auth_engine_resource
}

resource "vault_azure_auth_backend_role" "azure-aad-creds" {
  count = var.azure_auth_enabled ? 1 : 0
  backend                = vault_auth_backend.azure[0].path
  role                   = "azure-aad-creds"
  bound_subscription_ids = var.azure_auth_bound_subscription_ids
  bound_resource_groups  = var.azure_auth_bound_resource_groups
  token_ttl              = 60
  token_max_ttl          = 120
  token_policies         = ["default", "kv-rl"]
}

#resource "vault_azure_auth_backend_role" "testRole" {
  #count = var.azure_auth_enabled ? 1 : 0
  #backend                = vault_auth_backend.azure[0].path
  #role                   = "testRole"
  #bound_subscription_ids = var.bound_subscription_ids
  #bound_resource_groups  = var.bound_resource_groups
  #token_ttl              = 60
  #token_max_ttl          = 120
 # token_policies         = ["default", "kv-rl"]
#}
