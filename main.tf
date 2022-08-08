terraform {
  required_providers {
    tfe = {
      version = "~> 0.31.0"
    }
  }
}

provider "tfe" {
  hostname = var.hostname
}

resource "tfe_oauth_client" "oauth" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "drift_detection" {
  organization      = var.organization
  name              = "Drift_Detection"
  auto_apply        = false
  queue_all_runs    = true

  vcs_repo {
    identifier     = var.repo
    branch         = var.branch
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}

resource "tfe_variable" "token" {
  key="TFE_TOKEN"
  value=var.tfe_token
  category="env"
  sensitive=true
  workspace_id=tfe_workspace.drift_detection.id
  description="This allows the build agent to call back to TFC when executing plans and applies"
}

resource "tfe_variable" "organization" {
  key="organization"
  value=var.organization
  category="terraform"
  workspace_id=tfe_workspace.drift_detection.id
  description="Passing along the var setting from this config to the config that workspace drift_detection will use to generate the second workspace"
}

resource "tfe_variable" "hostname" {
  key="hostname"
  value=var.hostname
  category="terraform"
  workspace_id=tfe_workspace.drift_detection.id
}
