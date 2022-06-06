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

#data "tfe_agent_pool" "test" {
#  name         = "FOR_DEBUG"
#  organization = var.organization
#}

resource "tfe_oauth_client" "oauth" {
  organization     = var.organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "tfr" {
  count             = var.workspace_count
  organization      = var.organization
  name              = "tfr${count.index}"
  auto_apply        = true
  queue_all_runs    = true
  working_directory = var.working_directory

  vcs_repo {
    identifier     = var.repo
    branch         = var.branch
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}
