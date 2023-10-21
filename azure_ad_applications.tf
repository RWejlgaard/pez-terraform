data "azuread_client_config" "current" {}

resource "azuread_application" "cloudflare_access" {
  display_name = "Cloudflare Access"
  
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
      type = "Scope"
    }
  }
  
  web {
    redirect_uris = [ 
      "https://pezsh.cloudflareaccess.com/cdn-cgi/access/callback"
    ]

    implicit_grant {
      access_token_issuance_enabled = false
      id_token_issuance_enabled = false
    }
  }
}

resource "azuread_application_password" "cloudflare_access" {
  application_object_id = azuread_application.cloudflare_access.object_id
}