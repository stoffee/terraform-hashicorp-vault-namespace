#------------------------------------------------------------
# Enable userpass auth method in the 'admin/test' namespace
#------------------------------------------------------------
resource "vault_auth_backend" "userpass" {
  count      = var.userpass_auth_enabled ? 1 : 0
  depends_on = [vault_namespace.new]
  namespace  = vault_namespace.new.path
  type       = "userpass"
}

#-----------------------------------------------------------
# Create a user named 'student' with password, 'changeme'
#-----------------------------------------------------------
resource "vault_generic_endpoint" "vaultuser" {
  count                = var.userpass_auth_enabled ? 1 : 0
  depends_on           = [vault_auth_backend.userpass[0]]
  path                 = "auth/userpass/users/vaultuser"
  namespace            = vault_namespace.new.path
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["tester"],
  "password": "changeme"
}
EOT
}
