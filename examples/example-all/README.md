# Hashicorp Vault Namespace Module Examples

This is an example deployment with all Secret and Auth Engines supported by this module.

## Usage

### Everything On

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
  # UserPass Auth
  #
  userpass_auth_enabled = true

  #
  # AppRole Auth
  #
  approle_auth_enabled = true

  #
  # AWS Auth
  #
  aws_auth_enabled           = true
  aws_auth_engine_access_key = "MyAWSAccessKey"
  aws_auth_engine_secret_key = "MyAWSSecretKey"

  #
  # AWS Secrets Engine
  #
  aws_secret_enabled           = true
  aws_secret_engine_access_key = "MyAWSAccessKey"
  aws_secret_engine_secret_key = "MyAWSSecretKey"


  #
  # Azure Auth
  #
  azure_auth_enabled                = true
  azure_auth_engine_tenant_id       = "0YHAGTER-YHTR-RGDA-UHED-123456789098"
  azure_auth_bound_resource_groups  = "MYAzureRG"
  azure_auth_engine_client_id       = "0YHAGTER-YHTR-OKUY-GATE-123456789098"
  azure_auth_engine_client_secret   = "YHBASIHjijhasdiyuhOAJHSo"
  azure_auth_bound_subscription_ids = "0YHAGTER-OKYH-OKUY-TGFE-098765431212"
  azure_auth_engine_resource        = "MyAzureResource"

  #
  # Azure Secrets Engine
  #
  azure_secrets_enabled                    = true
  azure_secret_engine_client_id            = "0YHAGTER-YHTR-OKUY-GATE-123456789098"
  azure_secret_engine_client_secret        = "OUIHASIoijAPSJOAUHonasdokjm"
  azure_secrets_engine_subscription_id     = "f0YHAGTER-OKYH-OKUY-TGFE-098765431212"
  azure_secrets_role_application_object_id = "0YHAGTER-KJHE-FEDW-UHTE-098765431212"

  #
  # GCP Auth Engine
  #
  gcp_auth_enabled                       = true
  gcp_auth_engine_project_id             = "MyGCPProjectID"
  gcp_auth_engine_bound_service_accounts = "MyGCPServiceAccount"
  gcp_auth_engine_roles                  = "MyGCPRoles"

  #
  # GCP Secrets Engine
  #
  gcp_secrets_enabled        = true
  gcp_secrets_engine_project = "MyGCPProjectID"

}
```