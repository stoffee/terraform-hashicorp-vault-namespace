#------------------------------------------------------------
# Enable userpass auth method in the 'admin/test' namespace
#------------------------------------------------------------
resource "vault_auth_backend" "userpass" {
  count     = var.userpass_auth_enabled ? 1 : 0
  namespace = vault_namespace.new.path
  type      = "userpass"
}

resource "vault_generic_endpoint" "userpass_user1" {
  count                = var.userpass_auth_enabled ? 1 : 0
  depends_on           = [vault_auth_backend.userpass[0]]
  path                 = "auth/userpass/users/${var.userpass_user1}"
  namespace            = vault_namespace.new.path
  ignore_absent_fields = true

  data_json = <<EOK
{
  "policies": ["kv-transit-client","kv-full"],
  "password": "${var.userpass_user1_password}"
}
EOK
}

resource "vault_generic_endpoint" "userpass_admin" {
  count                = var.userpass_auth_enabled ? 1 : 0
  depends_on           = [vault_auth_backend.userpass[0]]
  path                 = "auth/userpass/users/${var.userpass_admin}"
  namespace            = vault_namespace.new.path
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["super-user-pol"],
  "password": "${var.userpass_admin_password}"
}
EOT
}
