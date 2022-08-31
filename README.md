# Hashicorp Vault Namespace Module

This repo contains a module for deploying a new [Vault](https://www.vault.io/) namespace on an existing Vault cluster using [Terraform](https://www.terraform.io/). [Vault Namespaces] (https://www.vaultproject.io/docs/enterprise/namespaces) is a Enterprise Vault feature.

---
# Hashicorp Vault Namespace Module Examples

Please check the [examples](https://github.com/stoffee/terraform-hashicorp-vault-namespace/tree/primary/examples) for example deployments.


## Usage

### LDAP with KV2

```hcl
module "vault-namespace" {
  source = "git@github.com:stoffee/terraform-hashicorp-vault-namespace.git"

  vault_addr  = "https://vault.mydomain.com:8200"
  namespace   = "MyCoolNewNamespace"
  vault_token = "vaulttoken.ijasdiawoskjnasdokijbnasd"

  #
  # KV2
  #
  kv2_enabled = true


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

  #
  # Transit Engine
  #
  transit_engine_enabled = false

  #
  # UserPass Auth
  #
  userpass_auth_enabled = false
  userpass_user1          = "vaultuser"
  userpass_user1_password = "ChangeMe"
  userpass_admin          = "VaultNamespaceAdmin
  userpass_admin_password = "ChangeMeAlso"

  #
  # AppRole Auth
  #
  approle_auth_enabled = false

  #
  # AWS Auth
  #
  aws_auth_enabled     = false

  #
  # AWS Secrets Engine
  #
  aws_secret_enabled   = false


  #
  # Azure Auth
  #
  azure_auth_enabled   = false

  #
  # Azure Secrets Engine
  #
  azure_secrets_enabled    = false

  #
  # GCP Auth Engine
  #
  gcp_auth_enabled     = false

  #
  # GCP Secrets Engine
  #
  gcp_secrets_enabled  = false

  #
  # SSH OTP
  #
  ssh_otp_enabled = false

  #
  # Kubernetes Auth
  #
  k8s_auth_engine = false
}
```