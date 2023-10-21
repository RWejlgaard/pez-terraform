terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
    azuread = {
      source  = "hashicorp/azuread"
    }
  }
  backend "s3" { }
}

provider "cloudflare" {
    email = local.secrets["cloudflare_email"]
    api_key = local.secrets["cloudflare_api_key"]
}

provider "azuread" {
  tenant_id = local.secrets["azure_tenant_id"]
}