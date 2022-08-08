variable "hostname" {
  type = string
}

variable "github_oauth_token" {
  type = string
}

variable "organization" {
  type = string
  default = "workspaces_managerment"
}

variable "branch" {
  type = string
  default = "workspace_child"
}

variable "repo" {
  type = string
  default = "rexredinger/tfe-terraform"
}

variable "tfe_token" {
  type = string
}
