resource "cloudflare_tunnel" "london-a" {
    account_id = cloudflare_account.this.id
    name = "London A"
    secret = ""
}

resource "cloudflare_tunnel" "london-b" {
   account_id = cloudflare_account.this.id
   name = "London B"
   secret = ""
}

resource "cloudflare_tunnel" "copenhagen-a" {
   account_id = cloudflare_account.this.id
   name = "Copenhagen A"
   secret = ""
}

resource "cloudflare_tunnel" "copenhagen-b" {
   account_id = cloudflare_account.this.id
   name = "Copenhagen B"
   secret = ""
}

resource "cloudflare_tunnel" "copenhagen-c" {
   account_id = cloudflare_account.this.id
   name = "Copenhagen C"
   secret = ""
}

resource "cloudflare_tunnel_config" "london-a" {
  account_id = cloudflare_account.this.id
  tunnel_id = cloudflare_tunnel.london-a.id
  config {
    ingress_rule {
      hostname = "grafana.pez.sh"
      service = "http://localhost:3000"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.grafana.aud ]
          required = true
          team_name = "pezsh"
        }
      }
    }
    ingress_rule {
      hostname = "portainer.pez.sh"
      service = "https://localhost:9443"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.portainer.aud ]
          required = true
          team_name = "pezsh" 
        }
        no_tls_verify = true
      }
    }
    ingress_rule {
      hostname = "prometheus.pez.sh"
      service = "http://localhost:9090"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.prometheus.aud ]
          required = true
          team_name = "pezsh" 
        }
      }
    }
    ingress_rule {
      hostname = "alertmanager.pez.sh"
      service = "http://localhost:9093"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.alertmanager.aud ]
          required = true
          team_name = "pezsh" 
        }
      }
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "london-b" {
  account_id = cloudflare_account.this.id
  tunnel_id = cloudflare_tunnel.london-b.id
  config {
    ingress_rule {
      hostname = "radarr.pez.sh"
      service = "http://192.168.1.253:7878"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.radarr.aud ]
          required = true
          team_name = "pezsh"
        }
        http_host_header = "localhost:7878"
      }
    }
    ingress_rule {
      hostname = "download.pez.sh"
      service = "http://localhost:9091"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.transmission.aud ]
          required = true
          team_name = "pezsh" 
        }
        http_host_header = "localhost:9091"
      }
    }
    ingress_rule {
      hostname = "sonarr.pez.sh"
      service = "http://localhost:8989"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.sonarr.aud ]
          required = true
          team_name = "pezsh" 
        }
        http_host_header = "localhost:8989"
      }
    }
    ingress_rule {
      hostname = "prowlarr.pez.sh"
      service = "http://localhost:9696"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.prowlarr.aud ]
          required = true
          team_name = "pezsh" 
        }
        http_host_header = "prowlarr.pez.sh"
      }
    }
    ingress_rule {
      hostname = "plex.pez.sh"
      service = "http://localhost:32400"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.plex.aud ]
          required = true
          team_name = "pezsh" 
        }
        http_host_header = "plex.pez.sh"
      }
    }
    ingress_rule {
      hostname = "overseer.pez.sh"
      service = "http://localhost:5055"
      origin_request {
        access {
          aud_tag = [ cloudflare_access_application.request.aud ]
          required = true
          team_name = "pezsh" 
        }
      }
    }
    ingress_rule {
      hostname = "request.pez.sh"
      service = "http://localhost:5055"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "copenhagen-a" {
  account_id = cloudflare_account.this.id
  tunnel_id = cloudflare_tunnel.copenhagen-a.id
  config {
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "copenhagen-b" {
  account_id = cloudflare_account.this.id
  tunnel_id = cloudflare_tunnel.copenhagen-b.id
  config {
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "cloudflare_tunnel_config" "copenhagen-c" {
  account_id = cloudflare_account.this.id
  tunnel_id = cloudflare_tunnel.copenhagen-c.id
  config {
    ingress_rule {
      service = "http_status:404"
    }
  }
}