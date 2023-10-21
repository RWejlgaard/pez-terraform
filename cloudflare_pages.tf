resource "cloudflare_pages_project" "pez-sh" {
  account_id        = cloudflare_account.this.id
  name              = "pez-sh"
  production_branch = "master"

  build_config {
    root_dir = "public"
  }

  source {
    type = "github"
    config {
      deployments_enabled           = true
      owner                         = "RWejlgaard"
      production_branch             = "master"
      production_deployment_enabled = true
      repo_name                     = "pez.sh"
    }
  }
}
