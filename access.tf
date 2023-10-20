
resource "cloudflare_access_identity_provider" "azure_ad" {
  account_id = cloudflare_account.this.id
  name = "Azure AD"
  type = "azureAD"
}

resource "cloudflare_access_application" "alertmanager" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Alertmanager"
  domain                     = "alertmanager.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
}

resource "cloudflare_access_application" "prometheus" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Prometheus"
  domain                     = "prometheus.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
}

resource "cloudflare_access_application" "portainer" {
  zone_id                   = cloudflare_zone.pez-sh.id
  name                      = "Portainer"
  domain                    = "portainer.pez.sh"
  type                      = "self_hosted"
  session_duration          = "730h"
  allowed_idps              = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity = false
  app_launcher_visible      = true
  http_only_cookie_attribute = true
}

resource "cloudflare_access_application" "request" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Request New Things"
  domain                     = "overseer.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
}

resource "cloudflare_access_application" "prowlarr" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Prowlarr - Indexers"
  domain                     = "prowlarr.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
  logo_url                   = "https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/prowlarr-banner.png"
}

resource "cloudflare_access_application" "plex" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Plex"
  domain                     = "plex.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = false
  logo_url                   = "https://static-00.iconduck.com/assets.00/plex-icon-2048x2048-kdgfrhh9.png"
}

resource "cloudflare_access_application" "grafana" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Grafana - Dashboards"
  domain                     = "grafana.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
  logo_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Grafana_icon.svg/351px-Grafana_icon.svg.png"
}

resource "cloudflare_access_application" "radarr" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Radarr - Movies"
  domain                     = "radarr.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
  logo_url                   = "https://static-00.iconduck.com/assets.00/radarr-icon-462x512-bydv4e4f.png"
}

resource "cloudflare_access_application" "transmission" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Transmission - Download Client"
  domain                     = "download.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
  logo_url                   = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Transmission_Icon.svg/1200px-Transmission_Icon.svg.png"
}

resource "cloudflare_access_application" "sonarr" {
  zone_id                    = cloudflare_zone.pez-sh.id
  name                       = "Sonarr - TV-Shows"
  domain                     = "sonarr.pez.sh"
  type                       = "self_hosted"
  session_duration           = "730h"
  allowed_idps               = [ cloudflare_access_identity_provider.azure_ad.id ]
  auto_redirect_to_identity  = false
  app_launcher_visible       = true
  http_only_cookie_attribute = true
  logo_url                   = "https://res.cloudinary.com/razordarkamg/image/upload/v1621212884/SonarrV3_pufacd.png"
}

resource "cloudflare_access_application" "app-launcher" {
  name                 = "App Launcher"
  type                 = "app_launcher"
  app_launcher_visible = false
}
