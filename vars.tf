locals {
  secrets = yamldecode(file("${path.module}/secrets/secrets.yml"))
}

# variable "cloudflare_email" {
#   type = string
#   sensitive = true
#   default = locals.secrets["cloudflare_email"]
# }

# variable "cloudflare_api_key" {
#   type = string
#   sensitive = true
#   default = locals.secrets["cloudflare_api_key"]
# }

# variable "cloudflare_state_access_key" {
#   type = string
#   sensitive = true
#   default = locals.secrets["cloudflare_state_access_key"]
# }

# variable "cloudflare_state_secret_key" {
#   type = string
#   sensitive = true
#   default = locals.secrets["cloudflare_state_secret_key"]
# }
