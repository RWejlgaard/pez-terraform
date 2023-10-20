terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
  }
  backend "s3" { }
}

provider "cloudflare" {
    email = local.secrets["cloudflare_email"]
    api_key = local.secrets["cloudflare_api_key"]
}