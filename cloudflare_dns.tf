resource "cloudflare_zone" "pez-sh" {
  account_id = cloudflare_account.this.id
  zone       = "pez.sh"
}

resource "cloudflare_record" "apps" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "apps"
  type    = "A"
  value   = "83.94.248.182"
  proxied = true
}

resource "cloudflare_record" "gopher" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "gopher"
  type    = "A"
  value   = "83.94.248.182"
  proxied = false
}

resource "cloudflare_record" "alertmanager" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "alertmanager"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-a.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "download" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "download"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "grafana" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "grafana"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-a.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "overseer" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "overseer"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "pez-sh" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "CNAME"
  value   = "pez-sh.pages.dev"
  proxied = true
}

resource "cloudflare_record" "plex" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "plex"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "portainer" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "portainer"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-a.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "prometheus" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "prometheus"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-a.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "prowlarr" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "prowlarr"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "public" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "public"
  type    = "CNAME"
  value   = "public.r2.dev"
  proxied = true
}

resource "cloudflare_record" "radarr" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "radarr"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "request" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "request"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "sig1-_domainkey" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "sig1._domainkey"
  type    = "CNAME"
  value   = "sig1.dkim.pez.sh.at.icloudmailadmin.com"
  proxied = false
}

resource "cloudflare_record" "sonarr" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "sonarr"
  type    = "CNAME"
  value   = "${cloudflare_tunnel.london-b.id}.cfargotunnel.com"
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "www"
  type    = "CNAME"
  value   = "pez-sh.pages.dev"
  proxied = true
}

resource "cloudflare_record" "mx-azure" {
  zone_id  = cloudflare_zone.pez-sh.id
  name     = "pez.sh"
  type     = "MX"
  value    = "ms99554544.msv1.invalid"
  priority = 32767
  proxied  = false
}

resource "cloudflare_record" "mx-icloud-1" {
  zone_id  = cloudflare_zone.pez-sh.id
  name     = "pez.sh"
  type     = "MX"
  value    = "mx01.mail.icloud.com"
  priority = 10
  proxied  = false
}

resource "cloudflare_record" "mx-icloud-2" {
  zone_id  = cloudflare_zone.pez-sh.id
  name     = "pez.sh"
  type     = "MX"
  value    = "mx02.mail.icloud.com"
  priority = 20
  proxied  = false
}

resource "cloudflare_record" "_dmarc" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=none; rua=mailto:pez@pez.sh"
  proxied = false
}

resource "cloudflare_record" "txt-azure" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "TXT"
  value   = "MS=ms99554544"
  proxied = false
}

resource "cloudflare_record" "txt-google" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "TXT"
  value   = "google-site-verification=BZD6ITg5SFnc7mQcb9KGkPwhP9gQKDZgw4nrFOZ0Y0w"
  proxied = false
}

resource "cloudflare_record" "txt-icloud" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "TXT"
  value   = "v=spf1 redirect=icloud.com"
  proxied = false
}

resource "cloudflare_record" "txt-icloud-verification" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "TXT"
  value   = "apple-domain=1zXuOydmezm51GT8"
  proxied = false
}

resource "cloudflare_record" "txt-keybase-verification" {
  zone_id = cloudflare_zone.pez-sh.id
  name    = "pez.sh"
  type    = "TXT"
  value   = "keybase-site-verification=w-WPdr0goQDQdGc_wgTh6ca50zKQnZ1agh9kOzw_sNo"
  proxied = false
}
