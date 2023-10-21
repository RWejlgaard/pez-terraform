resource "azuread_user" "rasmus" {
  display_name = "Rasmus Wejlgaard"
  user_principal_name = "rasmus@pez.sh"
}

resource "azuread_user" "khanh" {
  display_name = "Khanh Dang"
  user_principal_name = "kyan@pez.sh"
}