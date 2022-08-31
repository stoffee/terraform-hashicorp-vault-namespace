resource "vault_mount" "ssh_otp" {
  count          = var.ssh_otp_engine_enabled ? 1 : 0
  type = "ssh"
   namespace = vault_namespace.new.path
}

resource "vault_ssh_secret_backend_role" "foo" {
    name                    = "my-role"
    backend                 = vault_mount.ssh_otp[0].path
    key_type                = "ca"
    allow_user_certificates = true
}

resource "vault_ssh_secret_backend_role" "bar" {
    name          = "otp-role"
    backend       = vault_mount.ssh_otp[0].path
    key_type      = "otp"
    default_user  = var.ssh_default_user
 #   allowed_users = "default,baz"
    cidr_list     = var.ssh_cidr_list
}