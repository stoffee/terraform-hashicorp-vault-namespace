# Hashicorp Vault Namespace Module

This repo contains a module for deploying a new [Vault](https://www.vault.io/) namespace on an existing Vault cluster using [Terraform](https://www.terraform.io/). [Vault Namespaces] (https://www.vaultproject.io/docs/enterprise/namespaces) is a Enterprise Vault feature.

---
# Hashicorp Vault Namespace Module Examples

Please check the [examples](https://github.com/stoffee/terraform-hashicorp-vault-namespace/tree/primary/examples) for example deployments.


## Usage

### LDAP with KV2

```hcl
module "vault-namespace" {
  source  = "stoffee/vault-namespace/hashicorp//examples/example-all"
  version = ">= 0.1.8"

  vault_addr  = "https://vault.mydomain.com:8200"
  namespace   = "MyCoolNewNamespace"
  vault_token = "vaulttoken.ijasdiawoskjnasdokijbnasd"

  #
  # KV2
  #
  kv2_enabled = true
  vault_admin_group            = "VAULT_ADMIN"
  create_vault_admin_policy    = true
  vault_admin_policy_name      = "supah-user"


  #
  # LDAP Auth Engine
  #
  ldap_auth_enabled         = true
  ldap_auth_engine_ldap_url = "ldap://ldap.mydomain.com"
  ldap_auth_engine_bindpass = "MyLDAPBindUserPassword"
  ldap_auth_userdn          = "DC=na,DC=mydomain,DC=com"
  ldap_auth_userattr        = "cn"
  ldap_auth_groupattr       = "cn"
  ldap_auth_groupdn         = "OU=MyGroups,OU=MyOrg,OU=Exchange,DC=na,DC=MyDomain,DC=com"
  ldap_auth_groupfilter     = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
  ldap_auth_binddn          = "cn=vault_admin_user,ou=Users,dc=mydomain,dc=com"
  ldap_auth_insecure_tls    = false
  ldap_auth_starttls        =true
}
```