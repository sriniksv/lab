provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://192.168.29.220:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "d8ff30d8-81e3-7556-6d4a-42ca7dac8c6b"
      secret_id = "b1623453-4845-c9fe-fecc-2415cfbd6c95"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}
