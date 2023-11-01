provider "vault" {
  address = "http://127.0.0.1:8200"
  # Save that token somewhere else in release mode
  token = "hvs.TJh3hoxV75K5X7c7ySZCNrPu"
}

data "vault_generic_secret" "so_secret" {
  path = "secret/app"
}


output "so_secret" {
  value     = data.vault_generic_secret.so_secret.data["so_secret"]
  sensitive = true
}
